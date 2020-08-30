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
    
    let gradientLayer = CAGradientLayer()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1).cgColor
        layer.cornerRadius = 10
    }
    
    func configureCell(book: Book) {
        bookAuthor.text = "Author: \(book.author)"
        bookNotes.text = "Notes: \(book.note)"
        bookTitle.text = "Title: \(book.name)"
    }
    
    func setImage(imageName: UIImage) {
        bookImage.image = imageName
    }
}
