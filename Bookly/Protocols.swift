//
//  Protocols.swift
//  Bookly
//
//  Created by Meitar Basson on 28/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

protocol GetNote {
    func getNote(note: String)
}

protocol GetBook {
    func getBook(book: Book, image: UIImage)
}
