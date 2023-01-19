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
    let service = URLService()
    let address = "https://image.tmdb.org/t/p/w500"
    
    var filmId:Int = Int()
    
    @IBOutlet weak var filmPosterFull: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    
    var detailIndexPath:Int = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let film = model.filmObjects?.filter("id == \(filmId)").first
        
        guard let unwrFilmPic = film?.filmPic, let posterURL = URL(string: address + unwrFilmPic) else {return}
        
        service.getSetPoster(withURL: posterURL) { image in
            self.filmPosterFull.image = image
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
