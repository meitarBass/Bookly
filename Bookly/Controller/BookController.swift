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
        
        view.addGradientBackground(firstColor: #colorLiteral(red: 0.7176470588, green: 0.9725490196, blue: 0.8588235294, alpha: 0.6), secondColor: #colorLiteral(red: 0.3137254902, green: 0.6549019608, blue: 0.7607843137, alpha: 0.6), height: view.frame.height)
        
        title = book.name
        
        
//        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter-Bold", size: 20)!]

    }
    
    @IBAction func addNotePressed(_ sender: Any) {
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
                self.noteDelegate?.getNote(note: note)
                self.data.addNote(byBookID: self.bookID, note: note)
            }
        })
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        return alert
    }
}
