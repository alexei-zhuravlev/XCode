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

        model.readRealmData()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let xibCell = UINib(nibName: "FavoriteFilmCollectionViewCell", bundle: nil)
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FavoritFilmCell")
        collectionView.reloadData()
        
        collectionView.reloadData()
        
    }

    @IBAction func updateBtnPressed(_ sender: UIBarButtonItem) {
        collectionView.reloadData()
    }
}

extension FavoriteFilmsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.likedFilms?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritFilmCell", for: indexPath) as? FavoriteFilmCollectionViewCell else { return UICollectionViewCell()}
        
        cell.data = model.likedFilms?[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {return}

        destViewController.filmID = (model.likedFilms?[indexPath.row].id)!
        
        navigationController?.pushViewController(destViewController, animated: true)
        
    }
    
    
}
