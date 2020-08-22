//
//  BookCell.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookNotes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(book: Book) {
        bookAuthor.text = AUTHOR + book.author
        bookImage.image = UIImage(named: book.imgName)
        bookNotes.text = NOTES + book.note
        bookTitle.text = book.name
    }
}
