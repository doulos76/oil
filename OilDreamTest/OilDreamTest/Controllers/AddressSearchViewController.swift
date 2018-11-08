//
//  AddressSearchViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit
import Alamofire

class AddressSearchViewController: UIViewController {
  
  var areaCodeOils = [AreaCodeOil]()
  let areaCodeApi = AreaCodeApi()
  var areaCD = 0
  
  var address: [String] = []
  let cellId = "cellId"
  
  // MARK:- Instance Variable
  let addressSegmentedControl: UISegmentedControl = {
    let items = ["시/도", "시/군/구"]
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
    cv.backgroundColor = .white
    return cv
  }()
  
  // MARK:- Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigationBarUI()
    setupSegmentedControl()
    
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(AddressCell.self, forCellWithReuseIdentifier: cellId)
    displayAreaList(areaCD: areaCD)
    setupCollectionView(index: 0)
    segmentEnable()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    collectionView.reloadData()
    collectionView.layoutIfNeeded()
  }
  
  // MARK:- Setup Works
  func setupNavigationBarUI() {
    navigationItem.title = "주소기반 검색"
  }
  
  fileprivate func setupSegmentedControl() {
    view.addSubview(addressSegmentedControl)
    addressSegmentedControl.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 16, paddingBottom: 0, paddingLeading: 16, paddingTrailing: 16, width: 0, height: 20)
  }
  
  func setupCollectionView(index: Int) {
    view.addSubview(collectionView)
    collectionView.anchor(top: addressSegmentedControl.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 16, paddingBottom: 16, paddingLeading: 16, paddingTrailing: 16, width: 0, height: 01)
  }
  
  @objc func indexChanged(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      setupCollectionView(index: 0)
    case 1:
      setupCollectionView(index: 1)
    default:
      setupCollectionView(index: 0)
      break
    }
  }
  
  func segmentEnable() {
    if addressSegmentedControl.selectedSegmentIndex == 0 {
      addressSegmentedControl.setEnabled(true, forSegmentAt: 0)
      addressSegmentedControl.setEnabled(false, forSegmentAt: 1)
      areaCD = 0
      displayAreaList(areaCD: 0)
    } else if addressSegmentedControl.selectedSegmentIndex == 1 {
      addressSegmentedControl.setEnabled(true, forSegmentAt: 0)
      addressSegmentedControl.setEnabled(true, forSegmentAt: 1)
      areaCD = 0
      displayAreaList(areaCD: 0)
    }
  }
  
  fileprivate func changeAdministrativeDistrict() {
    print("change Administrative District")
    addressSegmentedControl.selectedSegmentIndex = 1
    
    displayAreaList(areaCD: areaCD)
    collectionView.reloadData()
    view.layoutIfNeeded()
  }
  
  func displayAreaList(areaCD: Int) {
    areaCodeApi.getAreaCode(areaCD: areaCD) { (areaCode) in
      if let areaCode = areaCode {
        self.areaCodeOils = areaCode.result.oil
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }
  }
}

extension AddressSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return areaCodeOils.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddressCell
    let areaCode = areaCodeOils[indexPath.row]
    cell.titleLabel.text = areaCode.areaName
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = CGSize(width: 100, height: 40)
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    areaCD = indexPath.row + 1
    collectionView.deselectItem(at: indexPath, animated: true)
    changeAdministrativeDistrict()
  }
  
}
