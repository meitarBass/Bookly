//
//  ViewExtension.swift
//  Bookly
//
//  Created by Meitar Basson on 30/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

// MARK: For Using Gradient

extension UIView {
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
