//
//  TestProjectTests.swift
//  TestProjectTests
//
//  Created by SF on 01.06.2021.
//

import XCTest
@testable import TestProject

class TestProjectTests: XCTestCase {
    
//    создаем экземпляр мок с тестовыми данными
    let mockUser = UserMock(firstName: "Some First Name", lastName: "Some Last Name", bio: "Some Bio For Mock User", city: "Some City", friends: [], isClosed: false)
    let mockFriend = UserMock(firstName: "Mock Friend Name", lastName: "Mock Friend Last Name", bio: "Mock Friend Bio", city: "Mock Friend City", friends: [], isClosed: false)
    
//    создаем свойства, которые будем менять у mockUser
    let newMockUserName = "Ivan"
    let newMockUserLastName = "Petrov"
    let newMockBio = "New Wonderfull Bio"
    let newMockCity = "New City"
    
//    делаем тест по методам класса
    func testChangeName() throws{
        mockUser.changeName(newMockUserName)
        XCTAssertTrue(mockUser.changeNameColled)
        XCTAssertTrue(mockUser.changeNameColledCount > 0)
        XCTAssertEqual(mockUser.firstName, newMockUserName)
    }
    
    func testChangeLastName() throws{
        mockUser.changeLastName(newMockUserLastName)
        XCTAssertTrue(mockUser.changeLastNameColled)
        XCTAssertTrue(mockUser.changeLastNameColledCount > 0)
        XCTAssertEqual(mockUser.lastName, newMockUserLastName)
    }
    
    func testChangeBio() throws{
        mockUser.changeBio(newMockBio)
        XCTAssertTrue(mockUser.changeBioColled)
        XCTAssertTrue(mockUser.changeBioColledCount > 0)
        XCTAssertEqual(mockUser.bio, newMockBio)
    }
    
    func testChangeCity() throws{
        mockUser.changeCity(newMockCity)
        XCTAssertTrue(mockUser.changeCityColled)
        XCTAssertTrue(mockUser.changeCityColledCount > 0)
        XCTAssertEqual(mockUser.city, newMockCity)
    }
    
    func testAddNewFriend() throws{
        mockUser.addFriend(mockFriend)
        XCTAssertTrue(mockUser.addFriendColled)
        XCTAssertTrue(mockUser.addFriendColledCount > 0)
        XCTAssertEqual(mockUser.friends.last!.firstName, mockFriend.firstName)
        XCTAssertEqual(mockUser.friends.last!.lastName, mockFriend.lastName)
    }
    
    func testIsClosed() throws{
        mockUser.changeClosed(true)
        XCTAssertTrue(mockUser.changeClosedColled)
        XCTAssertTrue(mockUser.changeClosedColledCount == 1)
        XCTAssertTrue(mockUser.isClosed)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}
