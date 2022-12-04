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
        didSet{
            guard data != nil else {return}
            posterPreviewImageView.image = UIImage(named: data?.filmPic ?? "image0")
            filmTitleLabel.text = data?.filmTitle
            releaseYearLabel.text = String(data?.releaseYear ?? 0)
            ratingLabel.text = String(data?.filmRating ?? 0)
        }
    }
}
