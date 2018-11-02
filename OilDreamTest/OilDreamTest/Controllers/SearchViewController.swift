//
//  SearchViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

struct SearchMenuItem {
  let icon: UIImage
  let title: String
}

class SearchViewController: UITableViewController {
  
//  var searchItems: [Search] = []
//  var searchItemTitle = ["주소 검색", "내 주변 검색", "도로 검색", "즐겨 찾기"]
//  var searchItemsImageTitles = ["building","gps","highwaySearch","favorite"]
  
  let searchMenuItems = [
    SearchMenuItem(icon: UIImage(named: "building")!, title: "주소 검색"),
    SearchMenuItem(icon: UIImage(named: "gps")!, title: "내 주변 검색"),
    SearchMenuItem(icon: UIImage(named: "highwaySearch")!, title: "도로 검색"),
    SearchMenuItem(icon: UIImage(named: "gps")!, title: "시군구별 평균 기름"),
    SearchMenuItem(icon: UIImage(named: "gps")!, title: "주유소 이름으로 검색"),
    SearchMenuItem(icon: UIImage(named: "favorite")!, title: "즐겨 찾기")
    
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "검색"
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(handleCancel))
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    tableView.tableFooterView = UIView()
  }
  
  @objc func handleCancel() {
    dismiss(animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchMenuItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) //as! SearchViewCell
//    cell.titleLabel.text = searchItems[indexPath.row].searchItemTitle
//    cell.logoImageView.image = UIImage(named: searchItems[indexPath.row].searchItemImage)
    let cell = SearchViewCell(style: .default, reuseIdentifier: "cellId")
    let menuItem = searchMenuItems[indexPath.row]
    cell.titleLabel.text = menuItem.title
    cell.logoImageView.image = menuItem.icon
//    cell.textLabel?.text = menuItem.title
//    cell.imageView?.image = menuItem.icon
//    cell.imageView?.tintColor = .darkGray
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let destinationController = didSelectSearchMenuItem(indexPath: indexPath)
    navigationController?.pushViewController(destinationController, animated: true)
  }
  
  func didSelectSearchMenuItem(indexPath: IndexPath) -> UIViewController {
    var destinationVC = UIViewController()
    switch indexPath.row {
    case 0:
      destinationVC = AddressSearchViewController()
    case 1:
      destinationVC = GasStationListViewController()
      dismiss(animated: true, completion: nil)
    case 2:
      destinationVC = HighwaySearchViewController()
    case 3:
      destinationVC = AdministrativeDistrictAvgOilPriceViewController()
    case 4:
      destinationVC = SearchByNameController()
    default:
      destinationVC = BookmarkViewController()
    }
    return destinationVC
  }
}
