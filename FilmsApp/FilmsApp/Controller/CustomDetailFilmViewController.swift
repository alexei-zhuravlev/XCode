//
//  CustomDetailFilmViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 11.11.2022.
//

import UIKit
import RealmSwift

class CustomDetailFilmViewController: UIViewController {
    
    
    @IBOutlet weak var fileTitle: UILabel!
    @IBOutlet weak var filmPoster: UIImageView!
    @IBOutlet weak var filmReleaseYear: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    @IBOutlet weak var filmCollectionOfPics: UICollectionView!
    @IBOutlet weak var filmReview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func posterTapped(_ sender: Any) {
    }
    
}
