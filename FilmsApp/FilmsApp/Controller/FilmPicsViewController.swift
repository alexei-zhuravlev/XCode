//
//  FilmPicsViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit
import RealmSwift

class FilmPicsViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var numbersOfPics: UILabel!
    
    var shotsFromFilmArray:[String] = []
    var address = "https://image.tmdb.org/t/p/w500"
    var urlService = URLService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numbersOfPics.text = "Всего \(shotsFromFilmArray.count) кадров"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }
}

extension FilmPicsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shotsFromFilmArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmPicsViewControllerCVC", for: indexPath) as? FilmPicsViewControllerCVC else {return UICollectionViewCell()}
        
        if !shotsFromFilmArray.isEmpty{
            let screenshotURLString = shotsFromFilmArray[indexPath.row]
            if let screenshotURL = URL(string: (self.address + screenshotURLString)){
                self.urlService.getSetPoster(withURL: screenshotURL) { image in
                    cell.shotFromFilmImage.image = image
                }
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "FullPicViewController") as? FullPicViewController else {return}
        
        destVC.shotsArray = shotsFromFilmArray
        
        navigationController?.pushViewController(destVC, animated: true)
    }
}
