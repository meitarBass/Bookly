//
//  DataSet.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import Foundation
import Firebase

class DataSet {
    let genres = [
        BookGenre(genre: "Math", imgName: "math"),
        BookGenre(genre: "Fairytale", imgName: "fairytale"),
        BookGenre(genre: "Fantasy", imgName: "fantasy"),
        BookGenre(genre: "Children's", imgName: "children's")
    ]
    
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    
    func getBooksByGenre(genre: String) {
        let booksRef = db.collection("Books")
        
        booksRef.whereField("Genre", isEqualTo: genre).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting docuemnts: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    func uploadImage(image: UIImage, book: Book) {
        let storageRef = Storage.storage().reference()
        
        let data = image.jpegData(compressionQuality: 0.75)! as NSData
        
        let filePathToSave = UUID().uuidString
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        storageRef.child("Books").child(filePathToSave).putData(data as Data, metadata: metadata) { (metaData, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            } else {
                self.addNewBook(book: book, imgPath: (metaData?.name)!)
            }
        }
    }
    
    func addNewBook(book: Book, imgPath: String) {
        // Add a new document with a generated ID
        db.collection("Books").document().setData([
            "Name": book.name,
            "Author": book.author,
            "Description": book.desciprtion,
            "Note": book.note,
            "Genre": book.bookGenre,
            "imgID": imgPath
        ]){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }   
    
    func downloadBooks(byGenre genre: String, completion: @escaping ([Book], [String]) -> Void) {
        let booksRef = db.collection("Books")
        var retrievedBooks = [Book]()
        var booksID = [String]()
        
        booksRef.whereField("Genre", isEqualTo: genre).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting docuemnts: \(err)")
                return
            } else {
                for document in querySnapshot!.documents {
                    booksID.append(document.documentID)
                    retrievedBooks.append(self.convertIntoBook(data: document.data()))
                }
                completion(retrievedBooks, booksID)
            }
        }
    }
    
    func convertIntoBook(data: [String : Any]) -> Book {
        let note = data["Note"] as! String
        let id = data["imgID"] as! String
        let author = data["Author"] as! String
        let title = data["Name"] as! String
        let description = data["Description"] as! String
        let genre = data["Genre"] as! String
        
        return Book(name: title, desciprtion: description, note: note, author: author, imgName: id, bookGenre: genre)
    }
    
    func downloadImage(path: String, completion: @escaping (UIImage) -> Void ) {
        let imgRef = storageRef.child("Books").child(path)
        imgRef.getData(maxSize: (10 * 1024 * 1024)) { (data, err) in
            if let err = err {
                print(err)
            } else {
                if let data = data {
                    if let myImage = UIImage(data: data) {
                        completion(myImage)
                    }
                    
                }
            }
        }
    }
    
    func addNote(byBookID bookID: String, note: String) {
        let ref = db.collection("Books").document(bookID)
        ref.updateData([
            "Note": note
        ]) { err in
            if let err = err {
                debugPrint("err \(err)")
            } else {
                print("Updated successfully")
            }
        }
    }
}


