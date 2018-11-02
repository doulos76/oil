//
//  SearchByNameController.swift
//  OilDreamTest
//
//  Created by dave on 01/11/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class SearchByNameController: UITableViewController {
  
  // MARK:- Instance Variables
  let cellId = "cellId"
  
  var searchByNameOils = [SearchByNameOil]()
  let searchByNameApi = SearchByNameApi()
  
  // MARK:- View Life Cycle Method
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    print(1)
    searchGastation(name: "보라매", areaCode: "01")
  }
  
  func searchGastation(name: String, areaCode: String = "01") {
    print(2)
    searchByNameApi.getSearchByName(for: "보라매", in: "01") { (searchByName) in
      if let searchByName = searchByName {
        self.searchByNameOils = searchByName.searchByNameResult.searchByNameOils
        print("\n=============== [ searchResult ] ================\n")
        DispatchQueue.main.async {
          print(self.searchByNameOils)
          self.tableView.reloadData()
        }
      }
    }
  }
  
  // MARK:- UITableView Data Source Method
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
    return cell
  }
}
