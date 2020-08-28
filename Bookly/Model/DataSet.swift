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
    
    func downloadBooks(byGenre genre: String, completion: @escaping ([Book]) -> Void) {
        let booksRef = db.collection("Books")
        var retrievedBooks = [Book]()
        
        booksRef.whereField("Genre", isEqualTo: genre).getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting docuemnts: \(err)")
                return
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    retrievedBooks.append(self.convertIntoBook(data: document.data()))
                }
                completion(retrievedBooks)
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
}


