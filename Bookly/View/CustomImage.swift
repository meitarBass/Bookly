//
//  CustomImage.swift
//  Bookly
//
//  Created by Meitar Basson on 30/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class CustomImage: UIImageView {

    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.masksToBounds = true
        layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1).cgColor
        layer.cornerRadius = 10
        
    }
}

