//
//  FilmObject.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 30.11.2022.
//

import Foundation
import RealmSwift

class FilmObject: Object{
    @objc dynamic var id: Int = 0
    @objc dynamic var filmPic: String = ""
    @objc dynamic var filmTitle: String = ""
    @objc dynamic var releaseYear: Int = 0
    @objc dynamic var filmRating: Double = 0
    @objc dynamic var isLikedByUser: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
