//
//  MyCell.swift
//  BankApp
//
//  Created by Алексей Журавлев on 02.06.2022.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelOperation: UILabel!
    @IBOutlet weak var labelAmount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
