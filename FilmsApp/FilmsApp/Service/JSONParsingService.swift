//
//  JSONParsingService.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 23.12.2022.
//

import Foundation
import RealmSwift

class JSONParsingService{
    
    func parseJSON(parseData: Data, parseError:Error?){
        
//        let model = Model()
        
        do{
            let filmObject = try JSONDecoder().decode(MoviesList.self, from: parseData)
            
            let jsonObjects = filmObject.results
            let realm = try? Realm()
            
            //запись в БД
            try realm?.write({
                for item in jsonObjects{
//                    let storage = StorageForBackdrops.shared
                    let object = FilmObject()
                    object.id = item.id ?? 0
                    object.filmTitle = item.original_title ?? "N/A"
                    object.filmPic = item.poster_path ?? "N/A"
                    object.overview = item.overview ?? "N/A"
                    object.releaseYear = Int(item.release_date?.prefix(4) ?? "0000") ?? 0000
                    object.filmRating = item.vote_average ?? 0
                    object.screenshots.append(item.backdrop_path ?? "N/A")
                    object.isLikedByUser = false
                    
                    // Обновляем объекты, чтобы не создавать их заново каждый раз
                    realm?.add(object, update: .all)
            }
            })
            
        }catch let error{
            print(error)
        }
        
    }
    
    func parseBackdrops(parseData:Data, parseError:Error?) -> [String]{
        var arrayToReturn:[String] = []
        do{
            let backdropObjest = try JSONDecoder().decode(ResultsForBackdrop.self, from: parseData)
            guard let jsonObjects = backdropObjest.backdrops else {return arrayToReturn}
            for el in jsonObjects{
                if let filePathString = el.file_path{
                    arrayToReturn.append(filePathString)
                }
            }
        } catch let error {
            print(error)
        }
        return arrayToReturn
    }
}
