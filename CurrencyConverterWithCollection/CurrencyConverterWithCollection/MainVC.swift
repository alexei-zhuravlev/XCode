//
//  MainVC.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import UIKit

class MainVC: UIViewController {
    
    
    var resultRatesArray:[String] = []
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var currenciesRateTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        currenciesRateTableView.delegate = self
        currenciesRateTableView.dataSource = self
        
        currenciesRateTableView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        currenciesRateTableView.reloadData()
//    }
//    
    @IBAction func addingPairofCurrenciesBtnPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let destination = storyboard.instantiateViewController(withIdentifier: "CurrenciesChoosingVC") as! CurrenciesChoosingVC
        
        destination.savingRateToArray = self
        
        present(destination, animated: true)

    }
    

}
