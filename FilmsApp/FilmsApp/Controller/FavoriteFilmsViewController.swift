//
//  FavoriteFilmsViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit
import RealmSwift

class FavoriteFilmsViewController: UIViewController {
    
    let model = Model()
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let xibCell = UINib(nibName: "FavoriteFilmCollectionViewCell", bundle: nil)
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FavoritFilmCell")
        collectionView.reloadData()
    }

    @IBAction func updateBtnPressed(_ sender: UIBarButtonItem) {
        collectionView.reloadData()
    }
}

extension FavoriteFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.likedFilmObjects?.count ?? 0 // новый массив здесь
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritFilmCell", for: indexPath) as? FavoriteFilmCollectionViewCell,
              
              let likedItem = model.likedFilmObjects?[indexPath.item] else {
            return UICollectionViewCell()
        }
        
        cell.data = likedItem
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {
            return
        }

        destViewController.filmID = model.likedFilmObjects?[indexPath.row].id ?? 0
        destViewController.cameFromFavs = true
        
        navigationController?.pushViewController(destViewController, animated: true)
        
    }
}
