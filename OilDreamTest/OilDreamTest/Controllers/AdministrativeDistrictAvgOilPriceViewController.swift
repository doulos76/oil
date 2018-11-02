//
//  AdministrativeDistrictAvgOilPriceViewController.swift
//  OilDreamTest
//
//  Created by dave on 30/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class AdministrativeDistrictAvgOilPriceViewController: UITableViewController {
  
  var avgSidoPriceOils = [AvgSidoPriceOil]()
  let avgSidoPriceApi = AvgSidoPriceApi()
  let cellId = "cellId"
  override func viewDidLoad() {
    view.backgroundColor = .white
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    displayAvgSidoPrice()
    
  }
  
  func displayAvgSidoPrice() {
    avgSidoPriceApi.getAvgSidoPrice { (avgSidoPrice) in
      if let avgSidoPrice = avgSidoPrice {
        self.avgSidoPriceOils = avgSidoPrice.avgSidoPriceResult.avgSidoOils
        
        DispatchQueue.main.async {
          print(self.avgSidoPriceOils)
          self.tableView.reloadData()
        }
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return avgSidoPriceOils.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    let sidoItem = avgSidoPriceOils[indexPath.row]
    
    cell.textLabel?.text = "\(sidoItem.price)"
    return cell
  }
  
}
