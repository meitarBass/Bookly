//
//  CategoryCell.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class GenreCell: UITableViewCell {

    @IBOutlet weak var genreImgView: UIImageView!
    @IBOutlet weak var genreTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(genre: BookGenre) {
        genreImgView.image = UIImage(named: genre.imgName)
        genreTitle.text = genre.genre
    }
}
