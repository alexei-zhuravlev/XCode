//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    
    @IBOutlet weak var filmPoster: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmReleaseYear: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    @IBOutlet weak var collectionOfPics: UICollectionView!
    @IBOutlet weak var filmDescription: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func tapGestureAction(_ sender: UITapGestureRecognizer) {
    }
    

}
