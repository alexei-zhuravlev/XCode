//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit
import RealmSwift

class FavoriteFilmsViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        let xibCell = UINib(nibName: "FavoriteFilmCollectionViewCell", bundle: nil)
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FavoritFilmCell")
        collectionView.reloadData()
    }

}

extension FavoriteFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model().likedFilms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritFilmCell", for: indexPath) as? FavoriteFilmCollectionViewCell else { return UICollectionViewCell()}
        
        cell.data = Model().likedFilms[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {return}
        
        let item = Model().likedFilms[indexPath.row]
        
        destViewController.receivedIndex = indexPath.row
        destViewController.cameFromFav = true
        
        navigationController?.pushViewController(destViewController, animated: true)
        
    }
    
    
}
