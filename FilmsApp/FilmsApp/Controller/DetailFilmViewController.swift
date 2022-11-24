//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    
    @IBOutlet weak var filmPoster: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmReleaseYear: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    @IBOutlet weak var collectionOfPics: UICollectionView!
    @IBOutlet weak var filmDescription: UITextView!
    @IBOutlet weak var addToFavorites: UIButton!
    
    
    var receivedIndex:Int = Int()
    
    var transition: RoundingTransition = RoundingTransition()
    
    var cameFromFav: Bool = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cameFromFav{
            filmPoster.image = UIImage(named: Model().likedFilms[receivedIndex].testPic ?? "image1")
            filmTitle.text = Model().likedFilms[receivedIndex].testTitle
            filmReleaseYear.text = "\(String(describing: Model().likedFilms[receivedIndex].testYear!))"
            filmRating.text = "\(String(describing: Model().likedFilms[receivedIndex].testRating!))"
            addToFavorites.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        } else{
            filmPoster.image = UIImage(named: Model().testArray[receivedIndex].testPic ?? "image1")
            filmTitle.text = Model().testArray[receivedIndex].testTitle
            filmReleaseYear.text = "Год выпуска -  \(String(describing: Model().testArray[receivedIndex].testYear!))"
            filmRating.text = "Рейтинг - \(String(describing: Model().testArray[receivedIndex].testRating!))"
            if Model().testArray[receivedIndex].isLiked{
                addToFavorites.setImage(UIImage(systemName: "trash.fill"), for: .normal)
            }else{
                addToFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting:
                             UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .show
        transition.start = filmPoster.center
        transition.roundColor = UIColor.clear
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionProfile = .cancel
        transition.start = filmPoster.center
        transition.roundColor = UIColor.clear
        return transition
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard segue.identifier == "tappedPoster" else {return}
        guard let destVC = segue.destination as? PosterFullViewController else {return}
        destVC.detailIndexPath = receivedIndex
        
        destVC.transitioningDelegate = self
        destVC.modalPresentationStyle = .custom
        
    }

    @IBAction func addToFavsBTNPressed(_ sender: Any) {
        Model().testArray[receivedIndex].isLiked = true
    }
}
