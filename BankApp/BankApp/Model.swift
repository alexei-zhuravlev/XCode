//
//  Model.swift
//  BankApp
//
//  Created by Алексей Журавлев on 31.05.2022.
//

import Foundation
import RealmSwift

//получаем доступ к хранилишу
let realm = try! Realm()

//получаем доступ к ДБ с историей операций
var hystory = realm.objects(OperationsHystory.self)

//получаем доступ к балансу
let itemForBalnce = realm.objects(Balance.self)
let balanceForLabel = itemForBalnce.first
let balanceUnwraped = balanceForLabel?.balance ?? 0.0
let balanceRounded = round(balanceUnwraped * 100)/100
let balanceForShow = String(balanceRounded)


//созданим перечисление с операциями
enum operationsType:String {
    case addMoney = "Пополнение депозита"
    case getMoney = "Снятие наличных"
    case putMoneyToPhone = "Пополнение баланса телефона"
}

//создадим протокол операций

protocol Operations{
    var money:Float { get }
    var operationType:String{get}
    
    func addMoney(money:Float)
    func getMoney(money:Float)
    func addOperationToHystory(operation:operationsType, phone:String)
}

// а теперь класс операций по этому протоколу
class BankOperations:Operations{
    
    var money: Float // сумма снятия, пополнения или перевода
    
    var operationType: String //тип операции
        
//    пополнение депозита
    func addMoney(money:Float) {
        let preBalance = realm.objects(Balance.self)
        let balance = preBalance.first
        if balance?.balance != nil {
            let oldBalance = balance!.balance
            let newBalance = oldBalance + money
            try! realm.write {
                balance?.balance = newBalance
            }
        } else{
            let oldBalance = 0.0
            let newBalance = Float(oldBalance) + money
            let item = Balance()
            item.balance = newBalance
            try! realm.write {
                realm.add(item)
            }
        }
        
    }
//    снятие денег с депозита
    func getMoney(money:Float) {
        let preBalance = realm.objects(Balance.self)
        let balance = preBalance.first
        let oldBalance = balance!.balance
        let newBalance = oldBalance - money
        try! realm.write {
            balance?.balance = newBalance
        }
    }
    
    func addOperationToHystory(operation: operationsType, phone:String = "") {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "dd-MM-yyyy"
        let dateForRecord = formatter.string(from: date as Date)
        
        let operationForRecord = operation
        
        let moneyForRecord = money
        
        let item = OperationsHystory()
        
        item.data = dateForRecord
        item.operation = operationForRecord.rawValue + "\n\(phone)"
        item.amount = moneyForRecord
        
        try! realm.write{
            realm.add(item)
        }
        
        
    }
    
    init(money:Float, operationType:operationsType){
        self.money = money
        self.operationType = operationType.rawValue
    }
    
}
