//
//  ViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit
import RealmSwift

let color1 = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

class MainViewController: UIViewController {
    

    
    let model = Model ()
    
    var searchController = UISearchController()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sortingButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try? Realm()
        let filmObiect = FilmObject()
//        filmObiect.filmRating = 5.6
//        filmObiect.filmPic = "image10"
//        filmObiect.id = 10
//        filmObiect.filmTitle = "Такое"
//        filmObiect.isLikedByUser = false
//        filmObiect.releaseYear = 2010
        
        print("&&&&&&&&&&&")
        print (realm?.configuration.fileURL)

//        do{
//            try realm?.write{
//                realm?.add(
//                    filmObiect
//                )
//            }
//        } catch{
//            print("\(error.localizedDescription)")
//        }

        
        model.readRealmData()

        collectionView.reloadData()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Find Your Film"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FilmCell")
        collectionView.reloadData()
    }

    @IBAction func favBTNPressed(_ sender: Any) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "FavoriteFilmsViewController") as? FavoriteFilmsViewController else {return}
        
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
    @IBAction func sortedBTNPressed(_ sender: UIBarButtonItem) {
        // 1. обозначаем константы с изображением
        let arrowUp = UIImage (systemName: "arrow.up")
        let arrowDown = UIImage (systemName: "arrow.down")
        // 2. переворачиваем значение sortAscending
        model.sortAscending = !model.sortAscending
        // 3. прописываем зависимость изображения от значения sortAscending
        sortingButton.image = model.sortAscending ? arrowUp : arrowDown
        // 4. вызываем метод сортировки
        model.ratingSort(ascending: model.sortAscending)
        // 5. перезагружаем collection view
        collectionView.reloadData()
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let filmObjectsNumber = model.arrayHelper?.count else {return Int()}

        return filmObjectsNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as? FilmCollectionViewCell else { return UICollectionViewCell()}

        cell.data = self.model.arrayHelper?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {return}

        destViewController.filmID = (model.arrayHelper?[indexPath.item].id)!
        
        navigationController?.pushViewController(destViewController, animated: true)
        
    }
    
    // MARK: - SearchBar Methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        model.arrayHelper = model.sortedFilmObjects
        model.search(searchTextValue: searchText)
        
        if searchBar.text?.count == 0{
            model.arrayHelper = model.sortedFilmObjects
        }
        
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        model.arrayHelper = model.sortedFilmObjects
        
        if searchBar.text?.count == 0{
            model.arrayHelper = model.sortedFilmObjects
        }
        
        collectionView.reloadData()
    }
    
}
