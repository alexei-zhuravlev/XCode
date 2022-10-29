//
//  StorageListOfMovies.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//

import Foundation

class StorageListOfMovies:StoringListOfMovies{
    
    static let shared = StorageListOfMovies()
    
    var listOfMovies = [ListOfMovies]()
    
    func storingListOfMovies(item: ListOfMovies){
        self.listOfMovies.append(item)
    }
}
