//
//  NewBookController.swift
//  Bookly
//
//  Created by Meitar Basson on 20/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit
import Firebase

class NewBookController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

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
    var bookDelegate: GetBook?
    
    var activityIndicator: CustomActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookNameField.delegate = self
        bookAuthorField.delegate = self
        
        bookDescriptionField.delegate = self
        bookDescriptionField.automaticallyAdjustsScrollIndicatorInsets = false
        
        imagePicker.delegate = self
        
        title = "New Book"
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Adding Book Name or Author
        if textField == bookNameField {
            addNewLabel(title: "Add Book", type: "Book", textView: nil, field: textField)
        } else if textField == bookAuthorField {
            addNewLabel(title: "Add Author", type: "Author", textView: nil, field: textField)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        // Adding Book Description
        if textView == bookDescriptionField {
            textView.isEditable = false
            addNewLabel(title: "Add Description", type: "Description", textView: textView, field: nil)
        }
    }

    @IBAction func pickImagePressed(_ sender: Any) {
        // Choosing Image
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            if  UIImagePickerController.isSourceTypeAvailable(.camera) {
                let alert = UIAlertController(title: "Camera or Gallery", message: "", preferredStyle: .alert)
                // Choose Using Camera
                let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                    self.imagePicker.sourceType = .camera
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
                // Choose From the Gallery
                let gallery = UIAlertAction(title: "Gallery", style: .default) { _ in
                    self.imagePicker.sourceType = .savedPhotosAlbum
                    self.present(self.imagePicker, animated: true, completion: nil)
                }
                
                self.imagePicker.allowsEditing = false
                
                alert.addAction(camera)
                alert.addAction(gallery)
                
                present(alert, animated: false, completion: nil)
            } else {
                self.imagePicker.sourceType = .savedPhotosAlbum
                self.imagePicker.allowsEditing = false
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Finished Picking Image
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.dismiss(animated: true, completion: {
                self.bookImage.image = pickedImage
            })
        }
    }
    
    @IBAction func doneAddingBook(_ sender: Any) {
        // Running Activity Indicator
        self.activityIndicator = CustomActivityIndicator(frame: CGRect(x: self.view.frame.width / 2 - 25, y: self.view.frame.height / 2 - 25, width: 50, height: 50))
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        
        // Generating New Book
        let newBook = (Book(name: bookNameField.text!, desciprtion: bookDescriptionField.text!, note: "", author: bookAuthorField.text!, imgName: "", bookGenre: genre.genre))
        
        // Uploading Book to the Storage
        ds.uploadImage(image: bookImage.image!, book: newBook) {
            self.ds.dataUpdatedSuccessfuly(happyMessage: "Added Book Successfuly")
            
            // Stop Indicator When Finished Uploading
            self.activityIndicator.stopAnimating()
        }
        
        // Passing the Book Back
        bookDelegate?.getBook(book: newBook, image: bookImage.image!)
    }
    
    func addNewLabel(title: String, type: String, textView: UITextView?, field: UITextField?) {
        // Add Title or Author
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
}
