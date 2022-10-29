//
//  JSONModel.swift
//  FilmsAppSwiftUI
//
//  Created by Алексей Журавлев on 19.10.2022.
//
import Foundation

//Модель для парсинга данных для основного экрана приложения

struct JSONModel:Codable{
    var id: Int
    var original_title: String?
    var poster_path:String?
    var release_date: String?
    var overview: String?
    var vote_average: Double?
    var backdrop_path:String?
}
