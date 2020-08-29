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
        layer.cornerRadius = 10
        addGradientBackground(firstColor: #colorLiteral(red: 0.7176470588, green: 0.9725490196, blue: 0.8588235294, alpha: 0.6), secondColor: #colorLiteral(red: 0.3137254902, green: 0.6549019608, blue: 0.7607843137, alpha: 0.6), height: 150)
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

extension UIView{
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor, height: CGFloat){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: height)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
