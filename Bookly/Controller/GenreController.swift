//
//  GenreController.swift
//  Bookly
//
//  Created by Meitar Basson on 16/08/2020.
//  Copyright © 2020 Meitar Basson. All rights reserved.
//

import UIKit

class GenreController: UIViewController, UITableViewDelegate, UITableViewDataSource, GetNote, GetBook {
    
    let CELL_HEIGHT: CGFloat = 150
    let CELL_SPACING: CGFloat = 8
    
    let ds = DataSet()
    var genre: BookGenre!
    var book: Book!
    var id: String!
    var bookImage: UIImage!
    
    var passedIndex: Int!
    
    var retrievedBooks = [Book]()
    var retrievedImages = [UIImage]()
    var bookID = [String]()
    
    var activityIndicator: CustomActivityIndicator!
        
    @IBOutlet weak var genresTable: UITableView!
    @IBOutlet weak var newBookButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        genresTable.delegate = self
        genresTable.dataSource = self
        // Do any additional setup after loading the view.
        
        // Running Activity Indicator
        activityIndicator = CustomActivityIndicator(frame: CGRect(x: view.frame.width / 2 - 25, y: view.frame.height / 2 - 25, width: 50, height: 50))
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        newBookButton.isEnabled = false
        
        // Adding Top Inset For the TableView
        genresTable.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        
        title = genre.genre
            
        // Getting Books From Online
        ds.downloadBooks(byGenre: genre.genre) { (books, ids) in
            self.bookID = ids
            
            // Got Data -> Stop Animating
            if books.count == 0 {
                self.newBookButton.isEnabled = true
                self.activityIndicator.stopAnimating()
                self.activityIndicator.removeFromSuperview()
            }
            
            // Got Books -> Organize Data & Stop Animating
            for (index, book) in books.enumerated() {
                self.ds.downloadImage(path: book.imgName) { (image) in
                    self.retrievedBooks.append(book)
                    self.retrievedImages.append(image)
                    
                    // Allow Editing When Done
                    if index == books.count - 1 {
                        self.genresTable.reloadData()
                        self.newBookButton.isEnabled = true
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.removeFromSuperview()
                    }
                    
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // For Adding Padding Between Cells
    func numberOfSections(in tableView: UITableView) -> Int {
        return retrievedBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genresTable.dequeueReusableCell(withIdentifier: CellIdentifiers.BookCell, for: indexPath) as! BookCell
        cell.configureCell(book: retrievedBooks[indexPath.section])
        cell.setImage(imageName: retrievedImages[indexPath.section])
        return cell
    }
    
    // Setting Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passedIndex = indexPath.section
        performSegue(withIdentifier: SegueIdentifiers.BookSegue, sender: nil)
    }
    
    // Setting Cell Spacing
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CELL_SPACING
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    @IBAction func addNewBookPressed(_ sender: Any) {
        performSegue(withIdentifier: SegueIdentifiers.NewBookSegue, sender: nil)
    }
    
    // MARK: Protocol Functions
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
