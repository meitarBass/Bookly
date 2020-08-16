//
//  GenreController.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class GenreController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = DataSet()
        
    @IBOutlet weak var genresTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genresTable.delegate = self
        genresTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.math.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = genresTable.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookCell {
            cell.bookAuthor.text = data.math[indexPath.row].author
            cell.bookImage.image = UIImage(named: data.math[indexPath.row].imgName)
            cell.bookNotes.text = data.math[indexPath.row].note
            cell.bookTitle.text = data.math[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
