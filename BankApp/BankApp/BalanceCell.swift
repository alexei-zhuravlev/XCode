//
//  BalanceCell.swift
//  BankApp
//
//  Created by Алексей Журавлев on 03.06.2022.
//

import UIKit

class BalanceCell: UITableViewCell {

    @IBOutlet weak var balnceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
