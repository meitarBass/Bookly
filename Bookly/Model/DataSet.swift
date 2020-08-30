//
//  DataSet.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import Foundation
import Firebase
import SCLAlertView

class DataSet {
    
    
    let genres = [
        BookGenre(genre: "Math", imgName: "math"),
        BookGenre(genre: "Fairytale", imgName: "fairytale"),
        BookGenre(genre: "Fantasy", imgName: "fantasy"),
        BookGenre(genre: "Children's", imgName: "children's"),
        BookGenre(genre: "Comics", imgName: "comics"),
        BookGenre(genre: "Biography", imgName: "biography"),
        BookGenre(genre: "Romance", imgName: "romance"),
        BookGenre(genre: "History", imgName: "history"),
        BookGenre(genre: "Self Help", imgName: "self help"),
        BookGenre(genre: "Cook Book", imgName: "cook book"),
        BookGenre(genre: "Poetry", imgName: "poetry"),
        BookGenre(genre: "Crime", imgName: "crime")
        
    ]
    
    let db = Firestore.firestore()
    let storageRef = Storage.storage().reference()
    
    // MARK: Upload Image
    
    func uploadImage(image: UIImage, book: Book, completion: @escaping () -> Void) {
        let storageRef = Storage.storage().reference()
        
        let data = image.jpegData(compressionQuality: 0.75)! as NSData
        
        let filePathToSave = UUID().uuidString
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        storageRef.child("Books").child(filePathToSave).putData(data as Data, metadata: metadata) { (metaData, err) in
            if let err = err {
                self.requestFailed(error: err.localizedDescription)
                return
            } else {
                self.addNewBook(book: book, imgPath: (metaData?.name)!)
                completion()
            }
        }
    }
    
    
    // MARK: Add New Book
    
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
                self.requestFailed(error: err.localizedDescription)
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    // MARK: Update Note
    
    func addNote(byBookID bookID: String, note: String) {
        let ref = db.collection("Books").document(bookID)
        ref.updateData([
            "Note": note
        ]) { err in
            if let err = err {
                debugPrint("err \(err)")
            } else {
                self.dataUpdatedSuccessfuly(happyMessage: "Your note was saved!")
                print("Updated successfully")
            }
        }
    }
    
    // MARK: Download Books From Online
    
    func downloadBooks(byGenre genre: String, completion: @escaping ([Book], [String]) -> Void) {
        let booksRef = db.collection("Books")
        var retrievedBooks = [Book]()
        var booksID = [String]()
            
        booksRef.whereField("Genre", isEqualTo: genre).getDocuments { (querySnapshot, err) in
            if let err = err {
                self.requestFailed(error: err.localizedDescription)
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
    
    // MARK: Download Image From Online
    
    func downloadImage(path: String, completion: @escaping (UIImage) -> Void ) {
        let imgRef = storageRef.child("Books").child(path)
        imgRef.getData(maxSize: (10 * 1024 * 1024)) { (data, err) in
            if let err = err {
                self.requestFailed(error: err.localizedDescription)
            } else {
                if let data = data {
                    if let myImage = UIImage(data: data) {
                        completion(myImage)
                    }
                    
                }
            }
        }
    }
    
    // MARK: Convert Data Into Book
    
    func convertIntoBook(data: [String : Any]) -> Book {
        let note = data["Note"] as! String
        let id = data["imgID"] as! String
        let author = data["Author"] as! String
        let title = data["Name"] as! String
        let description = data["Description"] as! String
        let genre = data["Genre"] as! String
        
        return Book(name: title, desciprtion: description, note: note, author: author, imgName: id, bookGenre: genre)
    }
    
    // MARK: Messages
    
    func requestFailed(error: String) {
        SCLAlertView().showError(error, subTitle: "Please try again later")
    }
    
    func dataUpdatedSuccessfuly(happyMessage message: String) {
        SCLAlertView().showSuccess("Data added successfuly", subTitle: message)
    }
    
    
}
