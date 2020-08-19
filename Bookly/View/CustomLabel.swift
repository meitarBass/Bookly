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
    
    override func drawText(in rect: CGRect) {
//        if let stringText = text {
//            let stringTextAsNSString = stringText as NSString
//            let labelStringSize = stringTextAsNSString.boundingRect(with: CGSize(width: self.frame.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: nil, context: nil).size
//                      super.drawText(in: CGRect(x:0,y: 0,width: self.frame.width, height:ceil(labelStringSize.height)))
//        } else {
//            super.drawText(in: rect)
//        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }

}
