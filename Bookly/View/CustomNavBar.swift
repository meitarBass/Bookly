//
//  CustomNavBar.swift
//  Bookly
//
//  Created by Meitar Basson on 29/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class CustomNavBar: UINavigationBar {

    override func awakeFromNib() {
        titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.mainFontBold, size: 20)!]

    }
}
