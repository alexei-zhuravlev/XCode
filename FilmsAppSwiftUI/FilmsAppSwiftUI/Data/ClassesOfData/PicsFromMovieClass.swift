//
//  PicsFromMovieClass.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 28.10.2022.
//

import Foundation

class PicsFromMovieClass:Identifiable{
    var id = UUID()
    var file_path:String
    var fileURL:String
    
    init(id: UUID = UUID(), file_path: String) {
        self.id = id
        self.file_path = file_path
        self.fileURL = TMDBDetails().urlToImagePath + file_path
    }
}
