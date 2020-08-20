//
//  CustomTextView.swift
//  Bookly
//
//  Created by Meitar Basson on 21/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.cornerRadius = 3
        layer.borderColor = #colorLiteral(red: 0.09712652117, green: 0.09715057164, blue: 0.09712334722, alpha: 1)
    }
    
}
