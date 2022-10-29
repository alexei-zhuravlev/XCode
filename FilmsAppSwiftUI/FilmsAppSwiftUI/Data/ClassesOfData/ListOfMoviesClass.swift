//
//  ListOfMoviesClass.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//

import Foundation

class ListOfMovies: Identifiable{
    var id:Int
    var original_title: String
    var poster_path:String
    var release_date: String
    var overview: String
    var vote_average: Double
    var backdrop_path:String
    var release_year: String
    
    init(id: Int, original_title: String, poster_path: String, release_date: String, overview: String, vote_average: Double, backdrop_path: String) {
        self.id = id
        self.original_title = original_title
        self.poster_path = poster_path
        self.release_date = release_date
        self.overview = overview
        self.vote_average = vote_average
        self.backdrop_path = backdrop_path
        
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd"
        let date = formater.date(from:release_date) ?? formater.date(from:"2022-01-01")
        self.release_year = date!.formatted(.dateTime.year())
    }
}
