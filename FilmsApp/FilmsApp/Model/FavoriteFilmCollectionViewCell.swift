//
//  FavoriteFilmCollectionViewCell.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 22.11.2022.
//

import UIKit

class FavoriteFilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favFilmPoster: UIImageView!
    @IBOutlet weak var favFilmTitle: UILabel!
    @IBOutlet weak var favFilmRating: UILabel!
    @IBOutlet weak var favFilmYear: UILabel!
    
    
    var data:Item?{
        didSet{
            guard data != nil else { return}
            favFilmPoster.image = UIImage(named: data?.testPic ?? "image1")
            favFilmPoster.layer.cornerRadius = 12
            favFilmTitle.text = data?.testTitle
            favFilmRating.text = String(data?.testYear ?? 0)
            favFilmYear.text = String(data?.testRating ?? 0)
        }
    }
    
    
}
