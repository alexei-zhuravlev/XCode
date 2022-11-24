//
//  Model.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 21.11.2022.
//

import Foundation

class Model{
    var testArray:[Item] = [Item(id: 0, testPic: "image1", testTitle: "Фильм1", testYear: 2001, testRating: 4.7, isLiked: false),
                            Item(id: 1, testPic: "image2", testTitle: "Фильм2", testYear: 2002, testRating: 5.3,isLiked: false),
                            Item(id: 2, testPic: "image3", testTitle: "Фильм3", testYear: 2003, testRating: 9.6, isLiked: false),
                            Item(id: 3, testPic: "image4", testTitle: "Фильм4", testYear: 2004, testRating: 8.3, isLiked: true),
                            Item(id: 4, testPic: "image5", testTitle: "Фильм5", testYear: 2005, testRating: 4.5, isLiked: false),
                            Item(id: 5, testPic: "image6", testTitle: "Фильм6", testYear: 2001, testRating: 3.2, isLiked: false),
                            Item(id: 6, testPic: "image7", testTitle: "Фильм7", testYear: 2008, testRating: 6.5, isLiked: true),
                            Item(id: 7, testPic: "image8", testTitle: "Фильм8", testYear: 2009, testRating: 6.3, isLiked: false),
                            Item(id: 8, testPic: "image9", testTitle: "Фильм9", testYear: 2011, testRating: 7.4, isLiked: true),
                            Item(id: 9, testPic: "image10", testTitle: "Фильм10", testYear: 2012, testRating: 4.7, isLiked: false),
                            Item(id: 10, testPic: "image11", testTitle: "Фильм11", testYear: 2013, testRating: 5.2, isLiked: false),
                            Item(id: 11, testPic: "image12", testTitle: "Фильм12", testYear: 2014, testRating: 7.8, isLiked: true),
                            Item(id: 12, testPic: "image13", testTitle: "Фильм13", testYear: 1998, testRating: 8.2, isLiked: false),
                            Item(id: 13, testPic: "image14", testTitle: "Фильм14", testYear: 1963, testRating: 2.9, isLiked: false),
                            Item(id: 14, testPic: "image15", testTitle: "Фильм15", testYear: 2015, testRating: 10.0, isLiked: false)]
    
    var likedFilms: [Item] {
        var likedTestArray:[Item] = [Item]()
        for i in testArray {
            if i.isLiked == true {
                likedTestArray.append(i)
            }
        }
        return likedTestArray
    }
    
    var newTestArray:[Item] = []
    var sortAscending: Bool = true
    
    func ratingSort () {
        self.testArray.sort {
            sortAscending ? ($0.testRating ?? 0) < ($1.testRating ?? 0) : ($0.testRating ?? 0) > ($1.testRating ?? 0)
        }
        newTestArray = testArray
    }
}

class Item{
    var id: Int?
    var testPic: String?
    var testTitle: String?
    var testYear: Int?
    var testRating: Double?
    var isLiked:Bool
    
    init(id: Int?, testPic: String?, testTitle: String?, testYear: Int?, testRating: Double?, isLiked: Bool) {
        self.id = id
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
        self.isLiked = isLiked
    }
}
