//
//  ViewController.swift
//  BankApp
//
//  Created by Алексей Журавлев on 31.05.2022.
//

import UIKit
//import SwiftUI
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var addMoney: UIButton!
    @IBOutlet weak var getMoney: UIButton!
    @IBOutlet weak var putMoneyToPhone: UIButton!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var hystoryView: UIView!
    @IBOutlet weak var tabelView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let viewsArray = [balanceView, messageView, hystoryView]
        for item in viewsArray{
            item?.layer.cornerRadius = 12
            item?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            item?.layer.shadowColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            item?.layer.shadowOffset = CGSize(width: 2, height: 3)
            item?.layer.shadowOpacity = 0.7
            item?.layer.shadowRadius = 3
        }
        
        balanceLabel.text = balanceForShow + " ₽"
        
    }

    
    
// Таблица с историей операций
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else{
            return UITableViewCell()}
        let dataForCell = hystory[indexPath.row].data
        let operationForCell = hystory[indexPath.row].operation
        let amountForCell = hystory[indexPath.row].amount
        
        cell.labelDate.text = dataForCell
        cell.labelOperation.text = operationForCell
        cell.labelAmount.text = String(round(amountForCell*100)/100)
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hystory.count
    }
    
    
//    Кнопка внести деньга на депозит
    @IBAction func addMoneyBtnPressed(_ sender: Any) {
        
        AlertActions.shared.alertAddMoney(controller: self)
    }
    
//    кнопка снять деньги с депозита
    @IBAction func getMoneyBtnPressed(_ sender: Any) {
        AlertActions.shared.alertGetMoney(controller: self)
    }
    
//    кнопка пополнить баланс телефона
    @IBAction func putMoneyToPhoneBtnPressed(_ sender: Any) {
        AlertActions.shared.alertMoneyToPhone(controller: self)
    }
    
}

