//
//  CustomCell.swift
//  MyToDoListMVC
//
//  Created by Алексей Журавлев on 19.04.2022.
//

import UIKit

protocol CustomCellDelegate{
    func editCell(cell:CustomCell)
    func deleteCell(cell:CustomCell)
}

class CustomCell: UITableViewCell {
    
    var delegate:CustomCellDelegate?

// MARK: Добавляем аутлеты элементов ячейки
    
    @IBOutlet weak var customCellTextLabel: UILabel!
    @IBOutlet weak var customCellEditButton: UIButton!
    @IBOutlet weak var customCellDeleteButton: UIButton!
    

//MARK: Добавляем действия при нажатии на кнопки ячейки
    
    @IBAction func customCellEditButtonAction(_ sender: UIButton) {
        delegate?.editCell(cell: self)
    }
    
    @IBAction func customCellDeleteButtonAction(_ sender: UIButton) {
        delegate?.deleteCell(cell: self)
    }
    
}
