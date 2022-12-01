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
        
        do {
        try realm?.write{
        realm?.add(filmObiect)
        }
        }catch{
            print("\(error.localizedDescription)")
        }
        

        
        
        model.newTestArray = model.testArray
        
        model.ratingSort()
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
        model.ratingSort()
        // 5. перезагружаем collection view
        collectionView.reloadData()
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.newTestArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as? FilmCollectionViewCell else { return UICollectionViewCell()}
        
        cell.data = self.model.newTestArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {return}
        
        destViewController.receivedIndex = model.newTestArray[indexPath.row].id ?? 0
        
        navigationController?.pushViewController(destViewController, animated: true)
        
    }
    
}
