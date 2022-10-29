//
//  ListOfMoviesModel.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//

import Foundation

struct ListOfMoviesRequest:Codable{
    var results: [JSONModel]
}
