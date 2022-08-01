//
//  GetCurrneciesRates.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import Foundation
import Alamofire

extension CurrenciesChoosingVC{
    
    
    func getCurrenciesRates(firstValue:String, secondValue:String, complition: @escaping GetComplited){
        
        let pairOfCurrnecies = firstValue+secondValue
        let url = "https://currate.ru/api/?get=rates&pairs=\(pairOfCurrnecies)&key=833ef633a3a4a2081e176c18a68f065c"
        
        AF.request(url).validate().responseJSON { response in
            let result = try! response.result.get()
            let resultDict = try! result as![String:Any]
            let resultForPrint = resultDict["data"]! as! [String:String]
            self.resultRate = resultForPrint[pairOfCurrnecies]!
            complition()
        }
    }
}
