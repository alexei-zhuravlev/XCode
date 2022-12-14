//
//  PosterFullViewController.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 10.11.2022.
//

import UIKit
import RealmSwift

class PosterFullViewController: UIViewController {
    
    let model = Model()
    
    var filmId:Int = Int()
    
    @IBOutlet weak var filmPosterFull: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var detailIndexPath:Int = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let film = model.filmObjects?.filter("id == \(filmId)").first

        filmPosterFull.image = UIImage(named: film?.filmPic ?? "image1")
//        filmPosterFull.image = UIImage(named: model.filmObjects?[detailIndexPath].filmPic ?? "image0")
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
