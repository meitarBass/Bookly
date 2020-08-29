//
//  CustomTextField.swift
//  Bookly
//
//  Created by Meitar Basson on 29/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 3
        layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "placeholder text",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)])
    }
    
}
