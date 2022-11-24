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
    
    var data:Item?{
        didSet{
            guard data != nil else { return}
            posterPreviewImageView.image = UIImage(named: data?.testPic ?? "image1")
            posterPreviewImageView.layer.cornerRadius = 12
            filmTitleLabel.text = data?.testTitle
            releaseYearLabel.text = String(data?.testYear ?? 0)
            ratingLabel.text = String(data?.testRating ?? 0)
        }
    }
}
