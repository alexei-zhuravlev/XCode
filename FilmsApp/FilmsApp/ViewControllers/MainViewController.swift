//
//  ViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit

let color1 = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

class MainViewController: UIViewController {
    
    var testArray = [TestModel(testPic: "image1", testTitle: "Фильм1", testYear: "2001", testRating: "4,7"),
                     TestModel(testPic: "image2", testTitle: "Фильм2", testYear: "2002", testRating: "5,3"),
                     TestModel(testPic: "image3", testTitle: "Фильм3", testYear: "2003", testRating: "9,6"),
                     TestModel(testPic: "image4", testTitle: "Фильм4", testYear: "2004", testRating: "8,3"),
                     TestModel(testPic: "image5", testTitle: "Фильм5", testYear: "2005", testRating: "4,5"),
                     TestModel(testPic: "image6", testTitle: "Фильм6", testYear: "2001", testRating: "3,2"),
                     TestModel(testPic: "image7", testTitle: "Фильм7", testYear: "2008", testRating: "6,5"),
                     TestModel(testPic: "image8", testTitle: "Фильм8", testYear: "2009", testRating: "6,3"),
                     TestModel(testPic: "image9", testTitle: "Фильм9", testYear: "2011", testRating: "7,4"),
                     TestModel(testPic: "image10", testTitle: "Фильм10", testYear: "2012", testRating: "4,7"),
                     TestModel(testPic: "image11", testTitle: "Фильм11", testYear: "2013", testRating: "5,2"),
                     TestModel(testPic: "image12", testTitle: "Фильм12", testYear: "2014", testRating: "7,8"),
                     TestModel(testPic: "image13", testTitle: "Фильм13", testYear: "1998", testRating: "8,2"),
                     TestModel(testPic: "image14", testTitle: "Фильм14", testYear: "1963", testRating: "2,9"),
                     TestModel(testPic: "image15", testTitle: "Фильм15", testYear: "2015", testRating: "10,0")]
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
        
        let xibCell = UINib(nibName: "FilmCollectionViewCell", bundle: nil)
        collectionView.register(xibCell, forCellWithReuseIdentifier: "FilmCell")
        collectionView.reloadData()
    }


}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmCell", for: indexPath) as? FilmCollectionViewCell else { return UICollectionViewCell()}
        
        cell.posterPreviewImageView.image = UIImage(named: testArray[indexPath.row].testPic ?? "image1")
        cell.posterPreviewImageView.layer.cornerRadius = 12
        cell.filmTitleLabel.text = testArray[indexPath.row].testTitle ?? "unknown"
        cell.releaseYearLabel.text = testArray[indexPath.row].testYear ?? "unknown"
        cell.ratingLabel.text = testArray[indexPath.row].testRating ?? "unknown"
        
        return cell
    }
    
    
}
