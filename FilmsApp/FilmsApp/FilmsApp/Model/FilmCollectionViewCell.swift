//
//  FilmCollectionViewCell.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 24.10.2022.
//

import UIKit

class FilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterPreviewImageView: UIImageView!
    @IBOutlet weak var filmTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
  
    var data:FilmObject?{
        didSet {
            guard let unwrData = data else {
                return
            }
            posterPreviewImageView.image = UIImage(named: unwrData.filmPic)
            filmTitleLabel.text = unwrData.filmTitle
            releaseYearLabel.text = String(unwrData.releaseYear)
            ratingLabel.text = String(unwrData.filmRating)
            
        }
    }
}
