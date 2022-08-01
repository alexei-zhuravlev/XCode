//
//  ChoosingCurrneciesVC.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import Foundation
import UIKit

extension CurrenciesChoosingVC: UICollectionViewDelegate{
    
}

extension CurrenciesChoosingVC:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.currencies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currency = self.currencies[indexPath.row]
        guard let cell = currenciesCollection.dequeueReusableCell(withReuseIdentifier: "MyCollectionCell", for: indexPath) as? MyCollectionCell else {return UICollectionViewCell()}
        
        cell.currencyBtn.setTitle(currency, for: .normal)
        cell.currencyBtn.addTarget(self, action: #selector(currencyBtnPressed), for: .touchUpInside)
        
        
        return cell
        
    }
    
    @objc func currencyBtnPressed(sender:UIButton!){
        
        switch self.pressingBtnCounter{
        case 0:
            sender.setTitleColor(.red, for: .normal)
            self.firstCurrenecy = (sender.titleLabel?.text)!
            self.currenciesChoosingLabel.text! += " \(self.firstCurrenecy)"
            self.pressingBtnCounter = 1
        case 1:
            sender.setTitleColor(.red, for: .normal)
            self.secondCurrency = (sender.titleLabel?.text)!
            self.currenciesChoosingLabel.text! += " и \(self.secondCurrency)"
            self.getCurrenciesRates(firstValue: self.firstCurrenecy, secondValue: secondCurrency){
                let resultRateForFinalPrint:String = "1 \(self.firstCurrenecy) = \(self.resultRate) \(self.secondCurrency)"

                self.savingRateToArray?.saveRatesToArrayDelegate(item: resultRateForFinalPrint)
                self.dismiss(animated: true)
            }
        default: return
        }
    }
}
