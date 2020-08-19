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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = genresTable.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookCell {
            cell.bookAuthor.text = "Author: \(books[indexPath.row].author)"
            cell.bookImage.image = UIImage(named: books[indexPath.row].imgName)
            cell.bookNotes.text = "Notes: \(books[indexPath.row].note)"
            cell.bookTitle.text = books[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        book = books[indexPath.row]
        performSegue(withIdentifier: "toBookController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BookController {
            vc.book = book
        }
    }
}
