//
//  FilmsAppUITests.swift
//  FilmsAppUITests
//
//  Created by Алексей Журавлев on 07.01.2023.
//

import XCTest

final class FilmsAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
//      Проверяем, что у нас название первого экрана - FilmsApp
        XCTAssertEqual(app.staticTexts.element(boundBy: 0).label, "FilmsApp")
        
//      Проверяем, что на экране что-то есть (так как мы не знаем какие фильмы будут "скачаны", то просто проверим, что экран не пуст)
        XCTAssert(app.staticTexts.count > 0)
        XCTAssertNotNil(app.staticTexts.element(boundBy: 1).label) // что на экране есть как минимум одно название для одного фильма
        
//      Ищем кнопку перехода на экран с избранными фильмами и нажимаем ее
        let button = app.buttons["FavBTN"].firstMatch
        button.tap()
        
//      Проверяем, что попали на экран "Избранные фильмы"
        XCTAssertEqual(app.staticTexts.element(boundBy: 0).label, "Избранные фильмы")
        
//      Проверяем - первым фильмом на экране избранных должен быть фильм "Достать ножи, стеклянная луковица"
        XCTAssertEqual(app.staticTexts.element(boundBy: 1).label, "Glass Onion: A Knives Out Mystery")
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
