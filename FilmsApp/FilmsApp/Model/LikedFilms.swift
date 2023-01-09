//
//  LikedFilms.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 24.12.2022.
//

import Foundation
import RealmSwift

class LikedFilmObiect: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var filmPic: String = ""
    @objc dynamic var filmTitle: String = ""
    @objc dynamic var about: String = ""
    @objc dynamic var releaseYear: Int = 0
    @objc dynamic var filmRating: Double = 0
    dynamic var screenshots: List<String> = List<String>()
    @objc dynamic var isLikedByUser: Bool = true
    
    override class func primaryKey() -> String? {
        return "id"}
}
