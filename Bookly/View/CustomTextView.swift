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
        layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        textColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
    }
    
}
