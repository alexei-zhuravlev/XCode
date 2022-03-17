//
//  MyCellTableViewCell.swift
//  ExploringTableView
//
//  Created by Алексей Журавлев on 16.03.2022.
//

import UIKit

class MyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
