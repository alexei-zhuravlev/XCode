//
//  FetchingPicsFromMovie.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 28.10.2022.
//

import Foundation

class FetchingPicsFromMovie{
    
    func fetchingPicsFromMovie(movie_id:Int,complition:@escaping()->()){
        
        let storage = PicsFromMovieStorage.shared
        var urlForWork = URLComponents.init(string: "https://api.themoviedb.org")!
        urlForWork.path = "/3/movie/\(movie_id)/images"
        urlForWork.queryItems = [
            URLQueryItem(name: "api_key", value: TMDBDetails().apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "include_image_language", value: "en,null")]
        var request = URLRequest(url: urlForWork.url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _,_) in
            if let data = data{
                do{
                    let result = try? JSONDecoder().decode(PicsFromMovieResponse.self, from: data)
                    guard let arrayOfItems = result?.backdrops else{return}
                    for item in arrayOfItems{
                        let itemForSaving = PicsFromMovieClass(file_path: item.file_path ?? "")
                        storage.storingPicToStorage(pic: itemForSaving)
                    }
                }
            }
            complition()
        }.resume()
    }
}
