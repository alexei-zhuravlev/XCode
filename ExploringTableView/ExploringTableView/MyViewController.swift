//
//  MyViewController.swift
//  ExploringTableView
//
//  Created by Алексей Журавлев on 16.03.2022.
//

import UIKit

class MyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let userArray = ["Евгения", "Николай", "Катерина", "Станислав", "Артур", "Марина", "Вячеслав", "Петр"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
      }
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "UniversalCell", bundle: nil), forCellReuseIdentifier: "UniversalCell")
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalCell", for: indexPath) as? UniversalCell else { return UITableViewCell() }
        cell.userName.text = userArray[indexPath.row]
        return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
      }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
      }
     
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Names"
      }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
      }
     
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "End of section"
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    


}
