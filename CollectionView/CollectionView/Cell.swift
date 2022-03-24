//
//  Cell.swift
//  CollectionView
//
//  Created by Алексей Журавлев on 24.03.2022.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temeratureImage: UIImageView!
    @IBOutlet weak var smileImage: UIImageView!
    
    func setTemperatureImage(tempName:String){
        temeratureImage.image = UIImage(named: tempName)
    }
    
    func setSmileImage(smileName:String){
        smileImage.image = UIImage(named: smileName)
    }
}
