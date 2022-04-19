//
//  TableViewController.swift
//  MyToDoListMVC
//
//  Created by Алексей Журавлев on 19.04.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    
//    MARK: Получаем доступ к модели, в которой происходят все вычисления
    
    let model = Model()
    
    var alert = UIAlertController()
    
//    MARK: добавим аутлеты кнопок бара навигации
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem! //добавить новую задачу
    @IBOutlet weak var sortingTasksButton: UIBarButtonItem! //сортировать список задач
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.definesPresentationContext = true
        definesPresentationContext = true
        
        tableView.separatorColor = .gray
        title = "Список Задач"
        
        model.sortByTitle()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.delegate = self //получаем доступ к делегату ячейки
        
        let currentItem = model.toDoItems[indexPath.row]
        cell.customCellTextLabel?.text = currentItem.string
        cell.accessoryType = currentItem.completed ? .checkmark: .none

        return cell
    }
    

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    изменение статуса (выполнено задание или нет При выполнении ставим "галочку" и меняем цвет ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if model.changeState(at: indexPath.row) == true{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            tableView.cellForRow(at: indexPath)?.backgroundColor = .gray
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            tableView.cellForRow(at: indexPath)?.backgroundColor = .clear
        }
    }

    override func tableView(_ tableView: UITableView,  commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            model.toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func editCellContent(indexPath:IndexPath){
//        получаем доступ к редактируемой ячейке
        let cell = tableView(tableView, cellForRowAt: indexPath) as! CustomCell
        
        alert = UIAlertController(title: "Введите текст", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(textField) -> Void in
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
            textField.text = cell.customCellTextLabel.text
        })
        
        let cancelAlertAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        let editAlertAction = UIAlertAction(title: "Изменить", style: .default){
            (createAlert) in
            
            guard let textField = self.alert.textFields, textField.count > 0 else{return}
            
            guard let textValue = self.alert.textFields?[0].text else {return}
            
            self.model.updateItem(at: indexPath.row, with: textValue)
            self.tableView.reloadData()
        }
        
        alert.addAction(cancelAlertAction)
        alert.addAction(editAlertAction)
        present(alert, animated: true, completion: nil)
    
        
    }
    
    @objc func alertTextFieldDidChange (_ sender: UITextField){
        guard let senderText = sender.text, alert.actions.indices.contains(1) else {return}
        let action = alert.actions[1]
        action.isEnabled = senderText.count > 0
    }
    
//    MARK: Нажимаем на кнопку добавить задачу
    
    @IBAction func addTaskButtonAction(_ sender: Any) {
        
        alert = UIAlertController(title: "Новая задача", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField:UITextField) in
            textField.placeholder = "Введите новую задачу"
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
        }
        
        let creatAlertAction = UIAlertAction(title: "Создать", style: .default){ (createAlert) in
            guard let unwrTextFieldValue = self.alert.textFields?[0].text else {return}
            
            self.model.addItem(itemName: unwrTextFieldValue)
            self.model.sortByTitle()
            self.tableView.reloadData()
        }
        
        let cancelAlertAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        alert.addAction(creatAlertAction)
        alert.addAction(cancelAlertAction)
        present(alert, animated: true, completion: nil)
        creatAlertAction.isEnabled = false
    }
    
//    MARK: Нажимаем на кнопку сортировки
    
    @IBAction func sortingTaskButtonAction(_ sender: Any) {
        
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        
        model.sortedAscending = !model.sortedAscending
        sortingTasksButton.image = model.sortedAscending ? arrowUp : arrowDown
        
        model.sortByTitle()
        tableView.reloadData()
    }
    
}

extension TableViewController: CustomCellDelegate{
    func editCell(cell: CustomCell) {
        let indexPath = tableView.indexPath(for: cell)
        guard let unwrIndexPath = indexPath else {return}
        
        self.editCellContent(indexPath: unwrIndexPath)
    }
    
    func deleteCell(cell: CustomCell) {
        let indexPath = tableView.indexPath(for: cell)
        guard let unwrIndexPath = indexPath else{return}
        
        model.removeItem(at: unwrIndexPath.row)
        tableView.reloadData()
    }
    
    
}
