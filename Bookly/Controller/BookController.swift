//
//  BookController.swift
//  Bookly
//
//  Created by Meitar Basson on 18/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class BookController: UIViewController {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookNotes: UILabel!
    @IBOutlet weak var bookDesciprtion: UILabel!
    
    let data = DataSet()
    var book: Book!

    override func viewDidLoad() {
        super.viewDidLoad()

        bookImage.image = UIImage(named: book.imgName)
        bookTitle.text = book.name
        bookAuthor.text = "Author: \(book.author)"
        bookNotes.text = "Notes: \(book.note)"
        bookDesciprtion.text = "Description: \(book.desciprtion)"
    }
    
    @IBAction func addNotePressed(_ sender: Any) {
        print("add note")
        var alert = UIAlertController(title: "Add Note", message: "", preferredStyle: .alert)
        alert = setAlert(alert: alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setAlert(alert: UIAlertController) -> UIAlertController {
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Add note"
        }
        
        
        let action = UIAlertAction(title: "Done", style: .default, handler: { _ -> Void in
            let firstTextField = alert.textFields![0] as UITextField
            if let note = firstTextField.text {
                self.bookNotes.text = "Notes: \(note)"
            }
        })
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        return alert
    }
}
