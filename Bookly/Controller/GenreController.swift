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
    var book: Book!
    var bookImage: UIImage!
    
    var retrievedBooks = [Book]()
    var retrievedImages = [UIImage]()
        
    @IBOutlet weak var genresTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genresTable.delegate = self
        genresTable.dataSource = self
        // Do any additional setup after loading the view.
        
        data.downloadBooks(byGenre: "Math") { (books) in
            for book in books {
                self.data.downloadImage(path: book.imgName) { (image) in
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
        book = retrievedBooks[indexPath.row]
        bookImage = retrievedImages[indexPath.row]
        performSegue(withIdentifier: SegueIdentifiers.BookSegue, sender: nil)
    }
    
    @IBAction func addNewBookPressed(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifiers.NewBookSegue, sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BookController {
            vc.book = book
            vc.image = bookImage
        } else if let vc = segue.destination as? NewBookController {
            vc.genre = genre
        }
    }
}
