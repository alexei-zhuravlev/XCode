//
//  MyCurrencyPairCell.swift
//  CurrencyConverterWithCollection
//
//  Created by Алексей Журавлев on 31.07.2022.
//

import UIKit

class MyCurrencyPairCell: UITableViewCell {
    
    
    @IBOutlet weak var choosedCurreniesPairRate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
