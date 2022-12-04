//
//  Model.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 21.11.2022.
//

import Foundation
import RealmSwift

class Model{
    
    let realm = try? Realm()
    
    var filmObjects: Results<FilmObject>?
    var sortedFilmObjects: Results<FilmObject>?
    var likedFilms: Results<FilmObject>?
    var arrayHelper: Results<FilmObject>?
    
    var sortAscending: Bool = false
    
    func readRealmData() {
        filmObjects = realm?.objects(FilmObject.self)
        sortedFilmObjects = filmObjects?.sorted(byKeyPath: "filmRating", ascending: sortAscending)
        likedFilms = filmObjects?.filter("isLikedByUser = true")
        arrayHelper = sortedFilmObjects
    }
        
    func ratingSort (ascending:Bool) {
        self.sortedFilmObjects = self.filmObjects?.sorted(byKeyPath: "filmRating", ascending: sortAscending)
    }
    
    func search(searchTextValue:String){
        let predicate = NSPredicate(format: "filmTitle CONTAINS [c]%@", searchTextValue)
        arrayHelper = sortedFilmObjects?.filter(predicate)
    }
    
    func updateLike(at item:Int){
        if let film = filmObjects?[item]{
            do{
                try realm?.write{
                    film.isLikedByUser = !film.isLikedByUser
                }
            } catch{
                print ("Error saving done status, \(error)")
            }
        }
    }
}


