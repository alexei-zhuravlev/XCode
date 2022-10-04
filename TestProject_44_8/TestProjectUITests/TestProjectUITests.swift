//
//  TestProjectUITests.swift
//  TestProjectUITests
//
//  Created by SF on 01.06.2021.
//

import XCTest

class TestProjectUITests: XCTestCase {

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
        
        
//        получаем таблицу
        let tableView = app.tables["MyTable"]
//        проверяем количество элементов в таблице (в нашем случае - 1 элемент)
        XCTAssert(tableView.cells.count == 1)
//        получаем массив ячеек таблицы
        let cells = tableView.cells.containing(.cell, identifier: "tableViewCell")
//        получаем текст ячейки
        let cellText = cells.staticTexts.element(boundBy: 0).label

//        тапаем на ячейку, чтобы открыть второй экран
        cells.staticTexts.element(boundBy: 0).tap()
//

//        Проверяем передалось ли полное имя на второй экран в лейбл FullNameLabel
        XCTAssert(app.descendants(matching: .staticText).matching(identifier: "FullNameLabel").element.label == cellText)
        
//        Можно проверить Москва ли город Петра Петрова
        XCTAssert(app.descendants(matching: .staticText).matching(identifier: "CityLabel").element.label == "Москва")
        

        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
