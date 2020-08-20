//
//  NewBookController.swift
//  Bookly
//
//  Created by Meitar Basson on 20/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class NewBookController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bookNameField: UITextField!
    @IBOutlet weak var bookAuthorField: UITextField!
    @IBOutlet weak var bookDescriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookNameField.delegate = self
        bookAuthorField.delegate = self
        bookDescriptionField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var title = ""
        var type = ""
    
        if textField == bookNameField {
            title = "Add Book"
            type = "Book"
        } else if textField == bookAuthorField {
            title = "Add Author"
            type = "Author"
        } else if textField == bookDescriptionField {
            title = "Add Description"
            type = "Description"
        }
        print(addNewLabel(title: title, type: type, field: textField))
    }

    @IBAction func pickImagePressed(_ sender: Any) {
        print("New Image")
    }
    
    func addNewLabel(title: String, type: String, field: UITextField) {
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "\(type)"
        }
        
        let action = UIAlertAction(title: "Add", style: .default, handler: { _ -> Void in
            let textField = alert.textFields![0] as UITextField
            if let message = textField.text {
                field.text = message
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: false, completion: nil)
    }
    
}
