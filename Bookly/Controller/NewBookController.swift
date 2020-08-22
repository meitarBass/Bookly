//
//  NewBookController.swift
//  Bookly
//
//  Created by Meitar Basson on 20/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class NewBookController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate{

    @IBOutlet weak var bookNameField: UITextField!
    @IBOutlet weak var bookAuthorField: UITextField!
    @IBOutlet weak var bookDescriptionField: UITextView!
    @IBOutlet weak var bookImage: UIImageView!
    
    var image: UIImage!
    var imagePicker = UIImagePickerController()
    var genre: BookGenre!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookNameField.delegate = self
        bookAuthorField.delegate = self
        bookDescriptionField.delegate = self
        
        bookDescriptionField.automaticallyAdjustsScrollIndicatorInsets = false
        
        imagePicker.delegate = self
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
        print("Caio adios I'm done")
        if let _ = genre {
            let _ = Book(name: bookNameField.text!, desciprtion: bookDescriptionField.text!, note: "", author: bookAuthorField.text!, imgName: "")
        }
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
        image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: {
            self.bookImage.image = self.image
        })
    }
    
}
