//
//  GenreController.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class GenreController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetNote, GetBook {
    
    let ds = DataSet()
    var genre: BookGenre!
    var book: Book!
    var id: String!
    var bookImage: UIImage!
    
    var passedIndex: Int!
    
    var retrievedBooks = [Book]()
    var retrievedImages = [UIImage]()
    var bookID = [String]()
        
    @IBOutlet weak var genresTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genresTable.delegate = self
        genresTable.dataSource = self
        // Do any additional setup after loading the view.
        
        ds.downloadBooks(byGenre: genre.genre) { (books, ids) in
            self.bookID = ids
            
            for book in books {
                self.ds.downloadImage(path: book.imgName) { (image) in
                    self.retrievedBooks.append(book)
                    self.retrievedImages.append(image)
                    self.genresTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return retrievedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genresTable.dequeueReusableCell(withIdentifier: CellIdentifiers.BookCell, for: indexPath) as! BookCell
        cell.configureCell(book: retrievedBooks[indexPath.row])
        cell.setImage(imageName: retrievedImages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passedIndex = indexPath.row
        performSegue(withIdentifier: SegueIdentifiers.BookSegue, sender: nil)
    }
    
    @IBAction func addNewBookPressed(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifiers.NewBookSegue, sender: nil)
    }
    
    func getNote(note: String) {
        retrievedBooks[passedIndex].note = note
        genresTable.reloadData()
    }
    
    func getBook(book: Book, image: UIImage) {
        retrievedBooks.append(book)
        retrievedImages.append(image)
        genresTable.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BookController {
            vc.book = retrievedBooks[passedIndex]
            vc.image = retrievedImages[passedIndex]
            vc.bookID = bookID[passedIndex]
            vc.noteDelegate = self
        } else if let vc = segue.destination as? NewBookController {
            vc.genre = genre
            vc.bookDelegate = self
        }
    }
}
