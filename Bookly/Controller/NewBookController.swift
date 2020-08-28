//
//  NewBookController.swift
//  Bookly
//
//  Created by Meitar Basson on 20/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit
import Firebase

class NewBookController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{

    @IBOutlet weak var bookNameField: UITextField!
    @IBOutlet weak var bookAuthorField: UITextField!
    @IBOutlet weak var bookDescriptionField: UITextView!
    @IBOutlet weak var bookImage: UIImageView!
    
    var image: UIImage!
    var imagePicker = UIImagePickerController()
    var imagePath: URL!
    var genre: BookGenre!
    
    let db = Firestore.firestore()
    var ds = DataSet()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookNameField.delegate = self
        bookAuthorField.delegate = self
        bookDescriptionField.delegate = self
        
        bookDescriptionField.automaticallyAdjustsScrollIndicatorInsets = false
        
        imagePicker.delegate = self
        
//        getBooksByGenre(genre: "Math")
        ds.downloadBooks(byGenre: "Math") { (books) in
            for book in books {
                print(book.name)
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == bookNameField {
            addNewLabel(title: "Add Book", type: "Book", textView: nil, field: textField)
        } else if textField == bookAuthorField {
            addNewLabel(title: "Add Author", type: "Author", textView: nil, field: textField)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == bookDescriptionField {
            textView.isEditable = false
            addNewLabel(title: "Add Description", type: "Description", textView: textView, field: nil)
        }
    }

    @IBAction func pickImagePressed(_ sender: Any) {
        print("New Image")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        } else if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func doneAddingBook(_ sender: Any) {
        let newBook = (Book(name: bookNameField.text!, desciprtion: bookDescriptionField.text!, note: "", author: bookAuthorField.text!, imgName: "", bookGenre: genre.genre))
        uploadImage(image: bookImage.image!, book: newBook)
    }
    
    func addNewLabel(title: String, type: String, textView: UITextView?, field: UITextField?) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "\(type)"
        }
        
        let action = UIAlertAction(title: "Add", style: .default, handler: { _ -> Void in
            let textField = alert.textFields![0] as UITextField
            if let message = textField.text {
                if let view = textView {
                    view.text = message
                    view.isEditable = true
                } else if let field = field {
                    field.text = message
                }
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: false, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: true, completion: {
                self.bookImage.image = pickedImage
            })
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
                print(metaData?.name)
                self.addNewBook(book: book, imgPath: (metaData?.name)!)
            }
        }
    }
    
}
