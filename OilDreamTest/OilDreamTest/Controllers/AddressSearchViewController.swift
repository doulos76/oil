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
  
  let dummyAddressOfSiDo = ["서울", "경기도", "인천", "제주도", "경상남도", "경상북도", "강원도", "충청남도", "충청북도", "전라남도", "전라북도", "부산", "대구", "대전", "서울", "경기도", "인천", "제주도", "경상남도", "경상북도", "강원도", "충청남도", "충청북도", "전라남도", "전라북도", "부산", "대구", "대전"]
  let dummyAddressOfSiGunGu = ["종로", "영등포", "구로", "강남", "송파", "관악", "종로", "영등포", "구로", "강남", "송파", "관악", "종로", "영등포", "구로", "강남", "송파", "관악", "종로", "영등포", "구로", "강남", "송파", "관악", "종로", "영등포", "구로", "강남", "송파", "관악", "종로", "영등포", "구로", "강남", "송파", "관악", "종로", "영등포", "구로", "강남", "송파", "관악"]
  let dummyAddressOfEupMyenDong = ["구로1", "서초", "숭의", "구월", "봉천", "신림", "신림2", "신림3", "용현1", "용현2", "구로1", "서초", "숭의", "구월", "봉천", "신림", "신림2", "신림3", "용현1", "용현2", "구로1", "서초", "숭의", "구월", "봉천", "신림", "신림2", "신림3", "용현1", "용현2", "구로1", "서초", "숭의", "구월", "봉천", "신림", "신림2", "신림3", "용현1", "용현2", "구로1", "서초", "숭의", "구월", "봉천", "신림", "신림2", "신림3", "용현1", "용현2", "구로1", "서초", "숭의", "구월", "봉천", "신림", "신림2", "신림3", "용현1", "용현2"]
  var address: [String] = []
  let cellId = "cellId"
  
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
    displayAreaList()
    setupCollectionView(index: 0)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //    collectionView.layoutIfNeeded()
    collectionView.reloadData()
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
      address = dummyAddressOfSiDo
      setupCollectionView(index: 0)
    case 1:
      address = dummyAddressOfSiGunGu
      setupCollectionView(index: 1)
    default:
      address = dummyAddressOfEupMyenDong
      setupCollectionView(index: 2)
      break
    }
    collectionView.reloadData()
  }
  
  fileprivate func changeAdministrativeDistrict() {
    print("change Administrative District")
    
  }

  func displayAreaList() {
    areaCodeApi.getAreaCode { (areaCode) in
      if let areaCode = areaCode {
        
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }
  }
}

extension AddressSearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //    let index = self.addressSegmentedControl.selectedSegmentIndex
    //    var address = dummyAddressOfSiDo
    //    switch index {
    //    case 0:
    //      address = dummyAddressOfSiDo
    //    case 1:
    //      address = dummyAddressOfSiGunGu
    //    case 2:
    //      address = dummyAddressOfEupMyenDong
    //    default:
    //      address = dummyAddressOfSiDo
    //    }
    //    return address.count
    return areaCodeOils.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddressCell
    let index = self.addressSegmentedControl.selectedSegmentIndex
    var address = dummyAddressOfSiDo
    switch index {
    case 1:
      address = dummyAddressOfSiGunGu
    case 2:
      address = dummyAddressOfEupMyenDong
    default:
      address = dummyAddressOfSiDo
    }
    cell.titleLabel.text = "\(address[indexPath.row])"
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = CGSize(width: 100, height: 40)
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    print(indexPath.row)
    changeAdministrativeDistrict()
  }
  
}
