//
//  Model.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 21.11.2022.
//

import Foundation
import UIKit
import RealmSwift

class Model{
    
    let realm = try? Realm()
    
    var filmObjects: Results<FilmObject>? {
        return realm?.objects(FilmObject.self)
    }
    
    var likedFilmObjects: Results<FilmObject>?
    
    var arrayHelper: Results<FilmObject>?
    
    var sortAscending: Bool = true

    func ratingSort(){
        arrayHelper = filmObjects?.sorted(byKeyPath: "filmRating", ascending: sortAscending)
    }

    func search(searchTextValue: String) {
        let predicate = NSPredicate(format: "filmTitle CONTAINS [c]%@", searchTextValue)
        arrayHelper = filmObjects?.filter(predicate)

    }
    
    func showLikedFilms() {
        let likeFilter = NSPredicate(format: "isLikedByUser = true")
        
        likedFilmObjects = filmObjects?.filter(likeFilter)
    }
    
    // объявили функцию с входным параметром
    func updateLike(at item: Int) {
        // сделали optional binding для объекта
        if let film = filmObjects?.filter("id == \(item)").first {
            // блок do/catch
            do {
                // запись в объект по "индексу" item
                try realm?.write {
                    // переворачиваем первоначальное значение лайка
                    film.isLikedByUser = !film.isLikedByUser
                }
            } catch {
                // обрабатываем ошибки
                print("Error saving done status, \(error)")
            }
        }
    }
    
    func changeColor(at sender: UIButton) {
        sender.backgroundColor = .red
    }
}


