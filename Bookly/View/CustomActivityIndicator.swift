//
//  CustomActivityIndicator.swift
//  Bookly
//
//  Created by Meitar Basson on 29/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class CustomActivityIndicator: UIActivityIndicatorView {

    override func awakeFromNib() {

    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Change the size of activity indicator
        transform = CGAffineTransform.init(scaleX: 1.25, y: 1.25)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
