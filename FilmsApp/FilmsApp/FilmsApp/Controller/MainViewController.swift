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
    let realm = try? Realm()
    
    var searchController = UISearchController()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sortingButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.ratingSort()
        
//        print(realm?.configuration.fileURL)
        
//        Тестируем запросы к API TMDB
        
        let test = URLService()
//        сейчас в кино
        test.nowPlayingFims()
//        популярные
        test.popularFilms()
//        последние
        test.getLatestFilms()
//        с высокими оценками
        test.topRatedFilms()
//        скоро выйдут
        test.upcomingFilms()
//        результаты тестов будут выведены в консоль

        collectionView.dataSource = self
        collectionView.delegate = self
        
        searchController.searchBar.delegate = self

        searchController.searchBar.placeholder = "Find Your Film"
        
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FilmCell")
 
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
//        collectionView.reloadData()
    }

    @IBAction func favBTNPressed(_ sender: Any) {
        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "FavoriteFilmsViewController") as? FavoriteFilmsViewController else {return}
        
        navigationController?.pushViewController(destViewController, animated: true)
    }
    
    @IBAction func sortedBTNPressed(_ sender: UIBarButtonItem) {
        // 1. обозначаем константы с изображением
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        
        // 2. переворачиваем значение sortAscending
        model.sortAscending = !model.sortAscending
        
        // 3. прописываем зависимость изображения от значения sortAscending
        sortingButton.image = model.sortAscending ? arrowUp : arrowDown
        
        // 4. вызываем метод сортировки
        model.ratingSort()
        
        // 5. перезагружаем collection view
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
//        collectionView.reloadData()
    }
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // возвращаем число элементов arrayHelper
        return model.arrayHelper?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // развёртываем опционал у arrayHelper, чтобы передавать его в методы ячейки
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as? FilmCollectionViewCell,
              
              let item = model.arrayHelper?[indexPath.row] else { // вот он [опционал]
           return UICollectionViewCell()
       }
        // а вот передача новых данных
        cell.data = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let destViewController = storyboard?.instantiateViewController(withIdentifier: "DetailFilmViewControllerS") as? DetailFilmViewController else {
            return
        }
        // передаём id из нового массива
        destViewController.receivedIndex = model.arrayHelper?[indexPath.row].id ?? 0
        destViewController.filmID = model.arrayHelper?[indexPath.row].id ?? 0
        navigationController?.pushViewController(destViewController, animated: true)
        
    }
    
    // MARK: - SearchBar Methods
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        model.arrayHelper = model.filmObjects
        model.search(searchTextValue: searchText)
    
        if searchBar.text?.count == 0 {
            model.arrayHelper = model.filmObjects
            model.ratingSort()
    }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
//        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        model.arrayHelper = model.filmObjects
        
        if searchBar.text?.count == 0 {
            model.arrayHelper = model.filmObjects
            model.ratingSort()
        }
        
        model.ratingSort()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
//        collectionView.reloadData()
    }
    }
    
