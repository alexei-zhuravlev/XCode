//
//  ShowImageVC.swift
//  CollectionView
//
//  Created by Алексей Журавлев on 24.03.2022.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    var imageName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image = UIImage(named: imageName)
    }
    
    func setImageName(name:String){
        imageName = name
    }
}
