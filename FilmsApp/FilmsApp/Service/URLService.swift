//
//  URLService.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 12.12.2022.
//

import Foundation
import UIKit

class URLService{
    let apiKey:String = "f05c1b5b6dd0ebe6d32e2048f4bba2af"
//    let apiURL:URL
    let session = URLSession.shared
    
//Функция запроса данных по имеющемуся URL
    func dataRequest(apiURL:URL){
        let task = session.dataTask(with: apiURL) { data, response, error in
            // data не опционал
            guard let unwrData = data,
            // data переходит в строку в локальной константе
                  let dataString = String(data: unwrData, encoding: .utf8),
            // response тайпкастится и проверяется код запроса
                  (response as? HTTPURLResponse)?.statusCode == 200,
            // error проверяется на nil
                   error == nil else {
               return
           }
            print("#################")
           print(dataString)
        }
        task.resume()
    }
    
    
//Запрос данных для получения списка недавно вышедших фильмов (Latest)
//    Важно помнить, что в этом списке появятся последние фильмы, выпущенные на английском языке (в качестве одного из языков фильма!)
    
    func getLatestFilms(){
        let latestFilmsURLString = "https://api.themoviedb.org/3/movie/latest?api_key=\(apiKey)&language=en-US"
        let latestFilmsURL = URL(string: latestFilmsURLString)
        guard let latestFilmsURL else {return}
        dataRequest(apiURL: latestFilmsURL)
    }
    
    
//Запрос данных для получения списка фильмов, которые идут в прокате сейчас (Now Playing)
    func nowPlayingFims(){
//        если нас будет интересовать больше, чем одна страница результатов, то следующий код можно сделать циклом
        let nowPlayingFilmsURLString = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)&language=en-US&page=1"
        let nowPlayingFilmsURL = URL(string: nowPlayingFilmsURLString)
        guard let nowPlayingFilmsURL else {return}
        dataRequest(apiURL: nowPlayingFilmsURL)
    }
    
    
//    Запрос данных на получение списка фильмов с высоким рейтингом (topRated)
    func topRatedFilms(){
        let topRatedFilmsURLString = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&language=en-US&page=1"
        let topRatedFilmsURL = URL(string: topRatedFilmsURLString)
        guard let topRatedFilmsURL else {return}
        dataRequest(apiURL: topRatedFilmsURL)
    }
    
//    Запрос данных на получение списка фильмоа, которые скоро выйдут в прокат (Upcoming)
    func upcomingFilms(){
        let upcomingFilmsURLString = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=en-US&page=1"
        let upcomingFilmsURL = URL(string: upcomingFilmsURLString)
        guard let upcomingFilmsURL else {return}
        dataRequest(apiURL: upcomingFilmsURL)
    }
    
    
//    Запрос данных на полученеи списка популярных фильмов (Popular). На самом деле это просто преобразованный "базовый" запрос, приведенный в теоретической части
    func popularFilms(){
        let popularFilmsURLString = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1"
        let popularFilmsURL = URL(string: popularFilmsURLString)
        guard let popularFilmsURL else {return}
        dataRequest(apiURL: popularFilmsURL)
    }
    
//    init(){
//        self.apiURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1")!
//
//    }
}
