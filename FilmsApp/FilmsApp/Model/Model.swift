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
    
    var likedFilmObjects: Results<LikedFilmObiect>? {
        return realm?.objects(LikedFilmObiect.self)
    }
    
    
    var arrayHelper: Results<FilmObject>?
    
    var sortAscending: Bool = true

    func ratingSort(){
        arrayHelper = filmObjects?.sorted(byKeyPath: "filmRating", ascending: sortAscending)
    }

    func search(searchTextValue: String) {
        let predicate = NSPredicate(format: "filmTitle CONTAINS [c]%@", searchTextValue)
        arrayHelper = filmObjects?.filter(predicate)

    }
    
    
    func deleteLikedItem(at item: Int) {
        do {
        try realm?.write({
        
            if let likedArray = likedFilmObjects, let likedObject = likedFilmObjects?.filter("id == \(item)").first {
                likedObject.isLikedByUser = !likedObject.isLikedByUser
                
                for i in likedArray {
                    if i.isLikedByUser == false {
                        realm?.delete(i)
                    }
                }
            }
        })
        } catch {
            print("Error saving done status, \(error)")
        }
    }
    
    // объявили функцию с входным параметром
    func updateLike(at item: Int) {
        var localChecker:[FilmObject] = []
        // сделали optional binding для объекта
        if let film = filmObjects?.filter("id == \(item)").first,
           let array = filmObjects{
//            let object = LikedFilmObiect()
            // блок do/catch
            do {
                // запись в объект по "индексу" item
                try realm?.write ({
                    // переворачиваем первоначальное значение лайка
                    film.isLikedByUser = !film.isLikedByUser
                    
                    for i in array{
                        if i.isLikedByUser == true{
                            localChecker.append(i)
                        }
                    }
//копируем выбранный фильм в БД лайкнутых
                    for el in localChecker{
                        let object = LikedFilmObiect()
                        object.id = el.id
                        object.filmPic = el.filmPic
                        object.releaseYear = el.releaseYear
                        object.filmRating = el.filmRating
                        object.isLikedByUser = el.isLikedByUser
                        object.about = el.overview
                        object.filmTitle = el.filmTitle
                        object.screenshots = el.screenshots
                        
                        realm?.add(object, update: .all)
                    }
                })
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


