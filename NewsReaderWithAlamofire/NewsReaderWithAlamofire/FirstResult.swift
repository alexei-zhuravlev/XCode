//
//  FirstResult.swift
//  NewsReaderWithAlamofire
//
//  Created by Алексей Журавлев on 24.07.2022.
//

import Foundation

struct FirstResult:Decodable{
    let status: String
    let totalResults: Int
    let articles: [MainResult]
    
    enum CodingKeys:String, CodingKey{
        case status
        case totalResults
        case articles = "articles"
    }
}
