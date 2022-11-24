//
//  PosterFullViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 10.11.2022.
//

import UIKit

class PosterFullViewController: UIViewController {
    
    @IBOutlet weak var filmPosterFull: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var detailIndexPath:Int = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filmPosterFull.image = UIImage(named: testArray[detailIndexPath].testPic ?? "image1")
        
    }
    
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
