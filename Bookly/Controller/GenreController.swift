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
    var genre: BookGenre!
    var books: [Book]!
    var book: Book!
        
    @IBOutlet weak var genresTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genresTable.delegate = self
        genresTable.dataSource = self
        // Do any additional setup after loading the view.
        books = data.getBooks(forGenre: genre.genre.lowercased())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(data.fantasy)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genresTable.dequeueReusableCell(withIdentifier: CellIdentifiers.BookCell, for: indexPath) as! BookCell
        cell.configureCell(book: books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        book = books[indexPath.row]
        performSegue(withIdentifier: SegueIdentifiers.BookSegue, sender: nil)
    }
    
    @IBAction func addNewBookPressed(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifiers.NewBookSegue, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BookController {
            vc.book = book
        } else if let vc = segue.destination as? NewBookController {
            vc.genre = genre
        }
    }
}
