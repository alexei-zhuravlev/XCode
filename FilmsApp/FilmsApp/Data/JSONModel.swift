//
//  JSONModel.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 17.10.2022.
//

import Foundation

class JSONModel:Codable{
    var original_title: String?
    var poster_path:String?
    var release_date: String?
    var overview: String?
    var vote_average: Double?
    var backdrop_path:String?
}
