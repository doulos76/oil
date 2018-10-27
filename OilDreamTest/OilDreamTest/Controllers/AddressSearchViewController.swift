//
//  AddressSearchViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class AddressSearchViewController: UIViewController {
  
  // MARK:- Instance Variable
  let addressSegmentedControl: UISegmentedControl = {
    let items = ["시/도", "시/군/구", "읍/면/동"]
    let segmentedControl = UISegmentedControl(items: items)
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    segmentedControl.backgroundColor = .white
    segmentedControl.tintColor = .black
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
    return segmentedControl
  }()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .darkGray
    return cv
  }()
  
  // MARK:- Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigationBarUI()
    setupSegmentedControl()
  }
  
  // MARK:- Setup Works
  func setupNavigationBarUI() {
    navigationItem.title = "주소기반 검색"
//    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
//    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(handleSettings))
  }
  
  fileprivate func setupSegmentedControl() {
    view.addSubview(addressSegmentedControl)
    addressSegmentedControl.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeading: 16, paddingTrailing: 16, width: 0, height: 20)
  }
  
  func setupCollectionView() {
    print("collectionView 1")
    view.addSubview(collectionView)
    collectionView.anchor(top: addressSegmentedControl.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeading: 16, paddingTrailing: 16, width: 0, height: 01)
  }
  
  @objc func indexChanged(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      print("index 0: 시/도")
      setupCollectionView()
    case 1:
      print("index 1: 시/군/구")
      setupCollectionView()
    default:
      print("index 2: 읍/면/동")
      setupCollectionView()
      break
    }
  }
  
  
}
