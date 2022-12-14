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
    
    var data:FilmObject?{
        didSet{
            guard data != nil else { return}
            favFilmPoster.image = UIImage(named: data?.filmPic ?? "image1")
            favFilmPoster.layer.cornerRadius = 12
            favFilmTitle.text = data?.filmTitle
            favFilmRating.text = String(data?.releaseYear ?? 0)
            favFilmYear.text = String(data?.filmRating ?? 0)
        }
    }
    

    @IBAction func removeFromFavoritesBtnPressed(_ sender: Any) {
        // разворачиваем опционал
        guard let likedData = data else {
            return
        }
        // вызываем метод updateLike
        model.updateLike(at: likedData.id)
        // изменяем вид ячейки
        if alpha == 0.55 {
            alpha = 1
        } else if alpha == 1 {
            alpha = 0.55
        }
    }
    
}
