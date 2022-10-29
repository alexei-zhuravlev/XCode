//
//  PicsFromMovieStorage.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 28.10.2022.
//

import Foundation

class PicsFromMovieStorage:StoringPicsToStorageProtocol{
    
    static let shared = PicsFromMovieStorage()
    
    var arrayOfPics = [PicsFromMovieClass]()
    
    func storingPicToStorage(pic: PicsFromMovieClass) {
        self.arrayOfPics.append(pic)
    }
}
