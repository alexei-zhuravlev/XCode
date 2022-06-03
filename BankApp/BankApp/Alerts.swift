//
//  Alerts.swift
//  BankApp
//
//  Created by Алексей Журавлев on 31.05.2022.
//

import Foundation
import UIKit
import RealmSwift


class AlertActions{
    
    private init(){}
    static let shared = AlertActions()
    
//    на случай если запрошена на снятие сумма, больше чем есть на депозите
    func alertNotEnoughMoney(controller:UIViewController){
        let alert = UIAlertController(title: "Внимание!", message: "На Вашем депозите недостаточно средств для совершения операции", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(cancel)
        controller.present(alert, animated: true)
    }
    
//    пополнение депозита
    
    func alertAddMoney(controller:UIViewController) {
//        получаю доступ к основной вьюхе
        guard let myVC = controller as? ViewController else {return}
        
        let alert = UIAlertController(title: "Пополнить депозит", message: "", preferredStyle: .alert)
        alert.addTextField{
            textField in
            textField.placeholder = "Введите сумму пополнения"
            textField.keyboardType = .decimalPad
        }
        
       
        
        let cancel = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        
        let save = UIAlertAction(title: "Пополнить", style: .cancel) { action in
            guard let textMoney = alert.textFields?.first, let moneyNum = Float(textMoney.text ?? "0.0") else {return}
            
            let operation = BankOperations(money: moneyNum, operationType: .addMoney)
            operation.addMoney(money: moneyNum)
            operation.addOperationToHystory(operation: .addMoney)
            
            let newBalance = realm.objects(Balance.self)
            let newBalanceForLabel = newBalance.first
            let newBalanceRounded = round(newBalanceForLabel!.balance * 100)/100
            
            let roundedMoney = round(moneyNum*100)/100
            myVC.messageLabel.text = "Внесено на депозит - \(roundedMoney) ₽"
            myVC.balanceLabel.text = String(newBalanceRounded) + " ₽"
            myVC.tableView.reloadData()

        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        controller.present(alert, animated: true)

    }
    
//    снятие наличных
    
    func alertGetMoney(controller:UIViewController) {
        
        guard let myVC = controller as? ViewController else {return}
        
        let alert = UIAlertController(title: "Снять наличные с депозита", message: "", preferredStyle: .alert)
        alert.addTextField{
            textField in
            textField.placeholder = "Введите сумму"
            textField.keyboardType = .decimalPad
        }
        
       
        
        let cancel = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        
        let save = UIAlertAction(title: "Снять", style: .cancel) { action in
            guard let textMoney = alert.textFields?.first, let moneyNum = Float(textMoney.text ?? "0.0") else {return}
            
            let oldBalance = realm.objects(Balance.self)
            let oldBalanceForCheck = oldBalance.first
            let oldBalanceRounded = round(oldBalanceForCheck!.balance * 100)/100
            
            if moneyNum <= oldBalanceRounded{
                let operation = BankOperations(money: moneyNum, operationType: .getMoney)
                operation.getMoney(money: moneyNum)
                operation.addOperationToHystory(operation: .getMoney)
                
                let newBalance = realm.objects(Balance.self)
                let newBalanceForLabel = newBalance.first
                let newBalanceRounded = round(newBalanceForLabel!.balance * 100)/100
                
                let roundedMoney = round(moneyNum*100)/100
                myVC.messageLabel.text = "Снято с депозита - \(roundedMoney) ₽"
                myVC.balanceLabel.text = String(newBalanceRounded) + " ₽"
                myVC.tableView.reloadData()
            } else{
                self.alertNotEnoughMoney(controller: myVC)
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        controller.present(alert, animated: true)

    }
    
//    пополнение номера телефона
    func alertMoneyToPhone(controller:UIViewController) {
        
        guard let myVC = controller as? ViewController else {return}
        
        let alert = UIAlertController(title: "Пополнить баланс телефона", message: "", preferredStyle: .alert)
        alert.addTextField{
            textField in
            textField.placeholder = "Введите сумму"
            textField.keyboardType = .decimalPad
        }
        alert.addTextField{
            textField in
            textField.placeholder = "Введите номер телефона"
            textField.keyboardType = .phonePad
        }
       
        
        let cancel = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        
        let save = UIAlertAction(title: "Пополнить", style: .cancel) { action in
            guard let textMoney = alert.textFields?.first, let moneyNum = Float(textMoney.text ?? "0.0") else {return}
            guard let textPhone = alert.textFields?[1], let phoneNumber = textPhone.text else {return}
            
            let oldBalance = realm.objects(Balance.self)
            let oldBalanceForCheck = oldBalance.first
            let oldBalanceRounded = round(oldBalanceForCheck!.balance * 100)/100
            
            if moneyNum <= oldBalanceRounded{
                let operation = BankOperations(money: moneyNum, operationType: .getMoney)
                operation.getMoney(money: moneyNum)
                operation.addOperationToHystory(operation: .putMoneyToPhone, phone: phoneNumber)
                
                let newBalance = realm.objects(Balance.self)
                let newBalanceForLabel = newBalance.first
                let newBalanceRounded = round(newBalanceForLabel!.balance * 100)/100
                
                let roundedMoney = round(moneyNum*100)/100
                
                myVC.messageLabel.text = "Пополнение баланса телефона \(phoneNumber) на сумму \(roundedMoney) ₽"
                myVC.balanceLabel.text = String(newBalanceRounded) + " ₽"
                myVC.tableView.reloadData()
            } else{
                self.alertNotEnoughMoney(controller: myVC)
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        controller.present(alert, animated: true)

    }
    
}
