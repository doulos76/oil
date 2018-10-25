//
//  AddressSearchViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class AddressSearchViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigationBarUI()
  }
  
  func setupNavigationBarUI() {
    navigationItem.title = "주소기반 검색"
//    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
//    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(handleSettings))
  }
}
