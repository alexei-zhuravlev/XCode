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
    
    var model = Model()
    let realm = try? Realm()
    
    var urlService = URLService()
    var address = "https://image.tmdb.org/t/p/w500"
    
    var receivedIndex:Int = Int()
    
    var transition: RoundingTransition = RoundingTransition()
    
    var item:Results<FilmObject>?
    
    var filmID:Int = Int()
    
    var cameFromFavs:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOfPics.delegate = self
        collectionOfPics.dataSource = self
        
        collectionOfPics.layer.borderWidth = 2.4
        collectionOfPics.layer.borderColor = UIColor.darkGray.cgColor
        
//        проверяем нет ли фильма в списке "любимых" (проверка по ID)
        if model.likedFilmObjects?.filter("id == \(self.filmID)").first != nil{
            cameFromFavs = true
        }
        
        DispatchQueue.main.async {

            self.item = self.model.filmObjects?.filter("id == \(self.filmID)")
            URLService().dataBacdropsRequest(movieID: self.item?.first?.id ?? 0) {
                DispatchQueue.main.async {
                    let object = self.model.filmObjects?.filter("id == \(self.item?.first?.id ?? 0)").first
                    for pic in StorageForBackdrops.shared.arrayOfBackdrops{
                        try! self.realm?.write({
                            object?.screenshots.append(pic)
                            self.realm?.add(object!, update: .all)
                        })
                    }
                }

                DispatchQueue.main.async {
                    self.collectionOfPics.reloadData()
                }
            }
            
            guard let unwrFilmPic = self.item?.first?.filmPic,
                  let posterURL = URL(string: self.address + unwrFilmPic) else {return}
            
            self.urlService.getSetPoster(withURL: posterURL) { image in
                self.filmPoster.image = image
            }
                    
            let itemForUsing = self.item?.first
            
            self.filmTitle.text = itemForUsing?.filmTitle
            self.filmReleaseYear.text = "Год выпуска -  \(String(itemForUsing?.releaseYear ?? 0))"
            self.filmRating.text = "Рейтинг - \(String(itemForUsing?.filmRating ?? 0))"
            if self.cameFromFavs == true {
                    self.addToFavorites.setImage(UIImage(systemName: "trash.fill"), for: .normal)
                }else{
                    self.addToFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                }
            self.filmDescription.text = itemForUsing?.overview ?? "N/A"
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

        if cameFromFavs{
            model.deleteLikedItem(at: filmID)
            addToFavorites.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            cameFromFavs = false
        }else{
            model.updateLike(at: filmID)
            addToFavorites.setImage(UIImage(systemName: "trash.fill"), for: .normal)
            cameFromFavs = true
        }
    }
    
    @IBAction func toFullPicsViewBtnPressed(_ sender: UIButton) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "FilmPicsViewController") as? FilmPicsViewController else {return}

        if let arrayToSend = self.model.filmObjects?.filter("id == \(self.filmID)").first?.screenshots{
            for el in arrayToSend {
                destViewController.shotsFromFilmArray.append(el)
            }
        }
        navigationController?.pushViewController(destViewController, animated: true)
    }
}

extension DetailFilmViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.item = self.model.filmObjects?.filter("id == \(self.filmID)")
        return self.item?.first?.screenshots.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionOfPics.dequeueReusableCell(withReuseIdentifier: "ShotsFromMovieCVC", for: indexPath) as? ShotsFromMovieCVC else {return UICollectionViewCell()}
        
        let movie = self.model.filmObjects?.filter("id == \(self.filmID)").first
        
        if !(movie?.screenshots.isEmpty)!{
            guard let screenshotURLString = movie?.screenshots[indexPath.row] else { return UICollectionViewCell()}
            if let screenshotURL = URL(string: (self.address + screenshotURLString)){
                self.urlService.getSetPoster(withURL: screenshotURL) { image in
                    cell.shotImage.image = image
                }
            }
        }
        return cell
    }
}
