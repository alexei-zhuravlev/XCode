//
//  PicsFromMovieModel.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 28.10.2022.
//

import Foundation


struct PicsFromMovieResponse:Codable{
    var id:Int?
    var backdrops: [PicsFromMovie]
}

struct PicsFromMovie:Codable{
    var file_path: String?
}
