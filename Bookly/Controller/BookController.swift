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
    
    // Current Book Data
    var book: Book!
    
    // Current Book Image and ID of Picture
    var image: UIImage!
    var bookID: String!
    
    var noteDelegate: GetNote?

    override func viewDidLoad() {
        super.viewDidLoad()
        bookImage.image = image
        bookTitle.text = book.name
        bookAuthor.text = "Author: \(book.author)"
        bookNotes.text = "Notes: \(book.note)"
        bookDesciprtion.text = "Description: \(book.desciprtion)"
    
        title = book.name
        
    }
    
    @IBAction func addNotePressed(_ sender: Any) {
        // Adding Note to a Specific Book
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
                // Passing the Note Back
                self.noteDelegate?.getNote(note: note)
                // Adding Note to the Storage
                self.data.addNote(byBookID: self.bookID, note: note)
            }
        })
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        return alert
    }
}
