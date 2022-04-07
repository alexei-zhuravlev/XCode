//
//  TaskVC.swift
//  TODO List
//
//  Created by Алексей Журавлев on 16.03.2022.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var userTaskField: UITextField!
    
    weak var saveTaskDeleagate: SaveUserTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveTaskBtnPressed(_ sender: Any) {
        if let task = userTaskField.text {
                 if !task.isEmpty {
                   let task = TaskModel(taskName: task, taskCellColor: .white)
                   saveTaskDeleagate?.saveTask(task: task)
                   dismiss(animated: true, completion: nil)
                 }
               }
    }
    
}
