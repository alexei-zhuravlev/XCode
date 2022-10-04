//
//  UserMock.swift
//  TestProject
//
//  Created by Алексей Журавлев on 04.10.2022.
//

import Foundation

class UserMock:User{
    
    
//    Счетчик количества раз, когда были вызваны методы класса User
    var changeNameColledCount = 0
    var changeCityColledCount = 0
    var changeClosedColledCount = 0
    var changeLastNameColledCount = 0
    var changeBioColledCount = 0
    var addFriendColledCount = 0
    
    
//    ИНдикатор того были ли вызваны методы класса User в принципе
    
    var changeCityColled = false
    var changeClosedColled = false
    var changeNameColled = false
    var changeLastNameColled = false
    var changeBioColled = false
    var addFriendColled = false

//    Добавляем новый функционал в методы класса User
    
    override func changeCity(_ city: String) {
        self.changeCityColledCount += 1
        self.changeCityColled = true
        self.city = city
    }
    
    override func changeClosed(_ isClosed: Bool) {
        self.changeClosedColledCount += 1
        self.changeClosedColled = true
        self.isClosed = isClosed
    }
    
    override func changeName(_ firstName: String) {
        self.changeNameColledCount += 1
        self.changeNameColled = true
        self.firstName = firstName
    }
    
    override func changeLastName(_ lastName: String) {
        self.changeLastNameColledCount += 1
        self.changeLastNameColled = true
        self.lastName = lastName
    }
    
    override func changeBio(_ bio: String) {
        self.changeBioColledCount += 1
        self.changeBioColled = true
        self.bio = bio
    }
    
    override func addFriend(_ friend: User) {
        self.addFriendColledCount += 1
        self.addFriendColled = true
        friends.append(friend)
    }
}
