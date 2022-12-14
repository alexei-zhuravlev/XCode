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
        
        cell.shotFromFilmImage.image = UIImage(named: shotsFromFilmArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "FullPicViewController") as? FullPicViewController else {return}
        
        destVC.shotsArray = shotsFromFilmArray
        
        navigationController?.pushViewController(destVC, animated: true)
    }
}
