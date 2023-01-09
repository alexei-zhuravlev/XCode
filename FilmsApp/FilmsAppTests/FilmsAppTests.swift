//
//  FilmsAppTests.swift
//  FilmsAppTests
//
//  Created by Алексей Журавлев on 06.01.2023.
//

import XCTest

final class FilmsAppTests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }

    
//    протестируем функцию загрузки данных, чтобы убедиться, что данные получаются
    let apiKey:String = "f05c1b5b6dd0ebe6d32e2048f4bba2af"
    let session = URLSession.shared
    var expectation: XCTestExpectation!
    
    func testAsynchronousURLConnection() throws {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=en-US&page=1") else {
            XCTFail("URL не найден")
            return
        }
        expectation = expectation(description: "testing downloading movie info from TMDB")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    XCTAssertNotNil(data, "Данные не должны быть nil")
                    XCTAssertNil(error, "Ошибка должна быть nil")
         
                    if let httpResponse = response as? HTTPURLResponse,
                       let responseURL = httpResponse.url {
                        XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "URL-адрес HTTP — ответа должен быть равен исходному URL-адресу")
                        XCTAssertEqual(httpResponse.statusCode, 200, "Код состояния ответа HTTP должен быть 200")
                    } else {
                        XCTFail("Response was not NSHTTPURLResponse")
                    }
         
                    self.expectation.fulfill()
                }
         
                task.resume()
         
                waitForExpectations(timeout: task.originalRequest?.timeoutInterval ?? 10) { error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                    task.cancel()
                }
    }

}
