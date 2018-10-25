//
//  GasStationListViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class GasStationListViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigationBarUI()
  }
  
  func setupNavigationBarUI() {
    navigationItem.title = "내 주변 검색"
    //    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
    //    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(handleSettings))
  }
}
