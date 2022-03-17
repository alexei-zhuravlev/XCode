//
//  MyTableViewController.swift
//  ExploringTableView
//
//  Created by Алексей Журавлев on 15.03.2022.
//

import UIKit
 
class MyTableViewController: UITableViewController {
 
 
  override func viewDidLoad() {
    super.viewDidLoad()
 
  }
 
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
 
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
}
