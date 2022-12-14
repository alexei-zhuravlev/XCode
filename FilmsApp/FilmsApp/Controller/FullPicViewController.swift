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
        
        cell.fullShotsImage.image = UIImage(named: shotsArray[indexPath.row])
        cell.countOfShot.text = "\((indexPath.row) + 1)/\(shotsArray.count)"
        
        return cell
    }
    
    
}
