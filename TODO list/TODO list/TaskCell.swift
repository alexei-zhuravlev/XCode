//
//  TaskCell.swift
//  TODO List
//
//  Created by Алексей Журавлев on 16.03.2022.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var someTask: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    func cellData(task: TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        print("remove")
    }
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        print("execute")
    }
    
}
