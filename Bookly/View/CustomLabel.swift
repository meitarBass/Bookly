//
//  CustomLabel.swift
//  Bookly
//
//  Created by Meitar Basson on 19/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    override func awakeFromNib() {
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

}
