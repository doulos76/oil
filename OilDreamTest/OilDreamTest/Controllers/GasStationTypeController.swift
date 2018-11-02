//
//  GasStationTypeController.swift
//  OilDreamTest
//
//  Created by dave on 30/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class GasStrationTypeSettingController: UITableViewController {
  
  let cellId = "cellId"
  let menu = ["주유소", "충전소"]
  override func viewDidLoad() {
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menu.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    let menuItem = menu[indexPath.row]
    cell.textLabel?.text = menuItem
    cell.accessoryType = .checkmark
    return cell
  }
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  
}
