//
//  TestModel.swift
//  FilmsApp
//
//  Created by Алексей Журавлев on 24.10.2022.
//

import Foundation

class TestModel{
    var testPic: String?
    var testTitle: String?
    var testYear: String?
    var testRating: String?
    
    init(testPic: String? = nil, testTitle: String? = nil, testYear: String? = nil, testRating: String? = nil) {
        self.testPic = testPic
        self.testTitle = testTitle
        self.testYear = testYear
        self.testRating = testRating
    }
}
