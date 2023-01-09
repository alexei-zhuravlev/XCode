//
//  FullPicViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import UIKit
import RealmSwift

class FullPicViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var shotsArray:[String] = []
    var address = "https://image.tmdb.org/t/p/original"
    var urlService = URLService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension FullPicViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shotsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullPicViewControllerCVC", for: indexPath) as? FullPicViewControllerCVC else {return UICollectionViewCell()}
        
        if !shotsArray.isEmpty{
            let screenshotURLString = shotsArray[indexPath.row]
            if let screenshotURL = URL(string: (self.address + screenshotURLString)){
                self.urlService.getSetPoster(withURL: screenshotURL) { image in
                    cell.fullShotsImage.image = image
                    cell.countOfShot.text = "\((indexPath.row) + 1)/\(self.shotsArray.count)"
                }
            }
        }
        return cell
    }
    
    
}
