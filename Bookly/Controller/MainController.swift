//
//  ViewController.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = DataSet()
    var genre: BookGenre!
    
    @IBOutlet weak var categoriesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Bookly"
        
        categoriesTable.delegate = self
        categoriesTable.dataSource = self
        categoriesTable.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        
//        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter-Bold", size: 20)!]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTable.dequeueReusableCell(withIdentifier: CellIdentifiers.GenreCell, for: indexPath) as! GenreCell
        cell.configureCell(genre: data.genres[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        genre = data.genres[indexPath.row]
        performSegue(withIdentifier: SegueIdentifiers.GenreSegue, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GenreController {
            vc.genre = genre
        }
    }


}

