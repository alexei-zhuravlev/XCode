//
//  MainVCTableExtension.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import Foundation
import UIKit

extension MainVC:UITableViewDelegate{
    
}

extension MainVC:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.resultRatesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCurrencyPairCell", for: indexPath) as? MyCurrencyPairCell else {return UITableViewCell()}
        
        cell.choosedCurreniesPairRate.text = resultRatesArray[indexPath.row]
        return cell
    }
}
