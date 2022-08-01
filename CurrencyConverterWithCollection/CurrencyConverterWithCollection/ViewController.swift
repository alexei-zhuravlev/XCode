//
//  ViewController.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import UIKit

typealias GetComplited = () -> ()

class CurrenciesChoosingVC: UIViewController {
    
    
    let currencies = ["BCH", "EUR", "GBP", "JPY", "RUB", "USD", "XRP", "BTC", "BTG", "BYN", "CAD", "CHF", "CNY", "ETH", "AED", "AMD", "BGN", "KZT", "TRY", "AUD", "GEL", "IDR", "AZN", "LKR", "MDL", "MMK", "RSD", "MYR", "NZD", "SGD", "UAH", "THB", "ILS", "KGS", "VND", "ZEC"]
    
/*
 будем учитывать колчиство выбранных валют. Если одна - продолжаем выбор, если две - делаем запрос по AF, выводим результат и закрываем окно выбора
 */
    
    var pressingBtnCounter = 0
    
//    выбранные валюты
    var firstCurrenecy:String = ""
    var secondCurrency:String = ""
    
//    результат запроса (курс первой валюты ко второй)
    var resultRate:String = ""
    
//    переменная для сохранения результатов запроса
    
    weak var savingRateToArray:saveRates?
    
    var temResultsArray:[String]=[]
    
    @IBOutlet weak var currenciesCollection: UICollectionView!
    @IBOutlet weak var currenciesChoosingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currenciesCollection.delegate = self
        currenciesCollection.dataSource = self
    }


}


