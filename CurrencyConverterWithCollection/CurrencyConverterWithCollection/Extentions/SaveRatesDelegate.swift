//
//  SaveRatesDelegate.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import Foundation

extension MainVC:saveRates{
    func saveRatesToArrayDelegate(item: String) {
        resultRatesArray.append(item)
        currenciesRateTableView.reloadData()
//        print("###########")
//        print(resultRatesArray)
//        print(resultRatesArray.count)
    }
}
