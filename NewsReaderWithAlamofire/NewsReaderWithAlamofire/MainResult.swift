//
//  MainResult.swift
//  NewsReaderWithAlamofire
//
//  Created by Алексей Журавлев on 24.07.2022.
//

import Foundation

struct MainResult:Decodable{
    let source: [String:String?]
    let author:String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
