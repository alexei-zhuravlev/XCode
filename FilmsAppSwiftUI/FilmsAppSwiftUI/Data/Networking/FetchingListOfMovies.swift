//
//  FetchingListOfMovies.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//

import Foundation

class FetchingListOfMovies{
    
    func fetchingListOfMovies(complition: @escaping()->()){
        let storage = StorageListOfMovies.shared
        var urlForWork = URLComponents.init(string: "https://api.themoviedb.org")!
        urlForWork.path = "/3/movie/top_rated"
        urlForWork.queryItems = [
            URLQueryItem(name: "api_key", value: TMDBDetails().apiKey),
            URLQueryItem(name: "language", value: "en-US")]
        
        let urlToFetch = urlForWork.url!
        var request = URLRequest(url: urlToFetch)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, _, _) in
            if let data = data{
                do{
                    let firstResult = try? JSONDecoder().decode(ListOfMoviesRequest.self, from: data)
                    if let result = firstResult?.results{
                        for item in result{
                            let itemForSaving = ListOfMovies(id: item.id , original_title: item.original_title ?? "unknown", poster_path: item.poster_path ?? "", release_date: item.release_date ?? "uknown", overview: item.overview ?? "Unknown", vote_average: item.vote_average ?? 0, backdrop_path: item.backdrop_path ?? "")
                            storage.storingListOfMovies(item: itemForSaving)
                        }
                    }
                }
            }
            complition()
        }.resume()
    }
}
