//
//  FavoriteFilmCollectionViewCell.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 22.11.2022.
//

import UIKit

class FavoriteFilmCollectionViewCell: UICollectionViewCell {
    
    let model = Model()
    
    var cellIndex: Int?
    
    @IBOutlet weak var favFilmPoster: UIImageView!
    @IBOutlet weak var favFilmTitle: UILabel!
    @IBOutlet weak var favFilmRating: UILabel!
    @IBOutlet weak var favFilmYear: UILabel!
    @IBOutlet weak var removeFromFavsBtn: UIButton!
    
    let urlService = URLService()
    let address = "https://image.tmdb.org/t/p/w500"
    
    
    var data:LikedFilmObiect?{
        didSet{
            guard let likedData = data, let url = URL(string: address + likedData.filmPic) else {return}
            
            
            urlService.getSetPoster(withURL: url) { image in
                self.favFilmPoster.image = image
            }
            
            favFilmPoster.layer.cornerRadius = 12
            favFilmTitle.text = likedData.filmTitle
            favFilmRating.text = String(likedData.filmRating)
            favFilmYear.text = String(likedData.releaseYear)
        }
    }
    

    @IBAction func removeFromFavoritesBtnPressed(_ sender: Any) {
        // разворачиваем опционал
        guard let likedData = data else {
            return
        }
        // вызываем метод updateLike

        model.deleteLikedItem(at: likedData.id)
        // изменяем вид ячейки
        if alpha == 0.55 {
            alpha = 1
        } else if alpha == 1 {
            alpha = 0.55
        }
    }
    
}
