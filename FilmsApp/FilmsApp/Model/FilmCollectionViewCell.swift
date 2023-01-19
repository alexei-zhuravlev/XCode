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
    
    var address = "https://image.tmdb.org/t/p/w500"
    
    let urlServise = URLService()
    let model = Model()
    
  
    var data:FilmObject?{
        didSet {
            guard let unwrData = data, let url = URL(string: address + unwrData.filmPic) else {
                return
            }
//            DispatchQueue.main.async {
//                self.urlServise.getSetPoster(withURL: url) { image in
//                    self.posterPreviewImageView.image = image
//                }
//            }
            urlServise.getSetPoster(withURL: url) { image in
                self.posterPreviewImageView.image = image
            }

            filmTitleLabel.text = unwrData.filmTitle
            releaseYearLabel.text = String(unwrData.releaseYear)
            ratingLabel.text = String(unwrData.filmRating)
            
        }
    }
}
