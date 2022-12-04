//
//  DetailFilmViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit
import RealmSwift

class DetailFilmViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    
    @IBOutlet weak var filmPoster: UIImageView!
    @IBOutlet weak var filmTitle: UILabel!
    @IBOutlet weak var filmReleaseYear: UILabel!
    @IBOutlet weak var filmRating: UILabel!
    @IBOutlet weak var collectionOfPics: UICollectionView!
    @IBOutlet weak var filmDescription: UITextView!
    @IBOutlet weak var addToFavorites: UIButton!
    
    let model = Model()
    
    var receivedIndex:Int = Int()
    
    var transition: RoundingTransition = RoundingTransition()
    
    var shotsArray = ["image1","image2","image3","image4"]
    
    var item:Results<FilmObject>?
    
    var filmID:Int = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOfPics.delegate = self
        collectionOfPics.dataSource = self
        
        model.readRealmData()
        
        item = model.filmObjects?.filter("id == \(filmID)")
        let itemForUsing = item?.first
        
            filmPoster.image = UIImage(named: itemForUsing?.filmPic ?? "image1")
            filmTitle.text = itemForUsing?.filmTitle
            filmReleaseYear.text = "Год выпуска -  \(String(itemForUsing?.releaseYear ?? 0))"
            filmRating.text = "Рейтинг - \(String(itemForUsing?.filmRating ?? 0))"
            if itemForUsing?.isLikedByUser == true {
                addToFavorites.setImage(UIImage(systemName: "trash.fill"), for: .normal)
            }else{
                addToFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
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
        
        destVC.filmId = filmID
        
        destVC.transitioningDelegate = self
        destVC.modalPresentationStyle = .custom
        
    }

    @IBAction func addToFavsBTNPressed(_ sender: Any) {
        model.readRealmData()
        item = model.filmObjects?.filter("id == \(filmID)")
        let itemForUsing = item?.first
        
        if itemForUsing?.isLikedByUser == true {
            model.updateLike(at: filmID)
            addToFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            model.updateLike(at: filmID)
            addToFavorites.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        }
    }
    
    @IBAction func toFullPicsViewBtnPressed(_ sender: UIButton) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "FilmPicsViewController") as? FilmPicsViewController else {return}
        
        destViewController.shotsFromFilmArray = shotsArray
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
}

extension DetailFilmViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionOfPics.dequeueReusableCell(withReuseIdentifier: "ShotsFromMovieCVC", for: indexPath) as? ShotsFromMovieCVC else {return UICollectionViewCell()}
        
        cell.shotImage.image = UIImage(named: shotsArray[indexPath.row])
        return cell
    }
    
    
}
