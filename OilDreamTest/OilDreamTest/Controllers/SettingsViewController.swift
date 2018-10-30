//
//  SettingsViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  var oils = [AvgAllPriceOil]()
  var avgAllPriceApi = AvgAllPriceApi()

  let headerView: UIView = {
    let view = UIView()
    view.backgroundColor = .naviBarCustomYellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let avgAllPriceLabel: UILabel = {
    let label = UILabel()
    label.text = "전국 평균"
    label.backgroundColor = .naviBarCustomYellow
    label.font = .systemFont(ofSize: 20)
    label.textColor = .black
    label.textAlignment = .left
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.backgroundColor = .naviBarCustomYellow
    label.textColor = .darkGray
    label.font = .systemFont(ofSize: 12)
    label.textAlignment = .right
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  

  let customView = UIView()
  
  var avgAllPriceHeaderView: AvgAllPriceHeaderView?
  var tableView: UITableView!
  let cellId = "cellId"
  let collectionViewCellId = "collectionViewCellId"
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = UIColor.lightGray
    return cv
  }()
  
  let gasStationMenus = [
    [GasStationSearchModel(imageName: "img", titleLabel: "주유소 타입", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "관심 유종", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "검색 상표", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "검색 반경", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "카드 할인", selectedLabel: "주유소")],
    [GasStationSearchModel(imageName: "img", titleLabel: "광고 없애기", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "App 공유하기", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "App 평가하기", selectedLabel: "주유소"),
    GasStationSearchModel(imageName: "img", titleLabel: "About us", selectedLabel: "주유소")]
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupNavigationBar()
    setupViews()
    setupCollectionView()
//    showAvgAllPrice()
    displayAvgAllPrice()
    setupTableView()
  }
  
  // MARK:- Setup Works
  
  fileprivate func setupViews() {
    view.addSubview(headerView)
    headerView.addSubview(avgAllPriceLabel)
    headerView.addSubview(dateLabel)
    
    headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    headerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    avgAllPriceLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16).isActive = true
    avgAllPriceLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
    avgAllPriceLabel.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
    avgAllPriceLabel.widthAnchor.constraint(equalTo: dateLabel.widthAnchor).isActive = true
    
    dateLabel.leadingAnchor.constraint(equalTo: avgAllPriceLabel.trailingAnchor).isActive = true
    dateLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16).isActive = true
    dateLabel.heightAnchor.constraint(equalTo: avgAllPriceLabel.heightAnchor).isActive = true
    dateLabel.topAnchor.constraint(equalTo: avgAllPriceLabel.topAnchor).isActive = true
  }
  
  fileprivate func setupNavigationBar() {
    navigationItem.title = "설정"
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(handleCancel))
  }

  fileprivate func setupCollectionView() {
    view.addSubview(collectionView)
    collectionView.register(AvgAllPriceViewCell.self, forCellWithReuseIdentifier: collectionViewCellId)
    collectionView.backgroundColor = .naviBarCustomYellow
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: self.avgAllPriceLabel.bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
  }
  
  fileprivate func setupTableView() {
    tableView = UITableView()
    tableView.backgroundColor = .white
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(GasStationSearchSettingCell.self, forCellReuseIdentifier: cellId)
    view.addSubview(tableView)
    tableView.anchor(top: collectionView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
  }
  
  func displayAvgAllPrice() {
    avgAllPriceApi.getAvgAllPrice { (avgAllPrice) in
      if let avgAllPrice = avgAllPrice {
        self.oils = avgAllPrice.result.avgAllPriceOils
        let tradeDate = avgAllPrice.result.avgAllPriceOils[0].tradeDate
        let dateString = self.dateHandler(date: tradeDate)
        DispatchQueue.main.async {
          self.dateLabel.text = dateString
          self.collectionView.reloadData()
        }
      }
    }
  }
  
  func dateHandler(date: String) -> String {
    var dateString = date
    let seperator = ", "
    var index = dateString.index(dateString.startIndex, offsetBy: 4)
    dateString.insert(contentsOf: seperator, at: index)
    index = dateString.index(dateString.endIndex, offsetBy: -2)
    dateString.insert(contentsOf: seperator, at: index)
    return dateString
  }
  
  @objc func handleCancel() {
    dismiss(animated: true, completion: nil)
  }
}

// MARK:- TableView Methods
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    var title = ""
    if section == 0 {
      title = "주유소 검색 설정"
    } else {
      title = " "
    }
    return title
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gasStationMenus[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GasStationSearchSettingCell
    let gasStationMenu = gasStationMenus[indexPath.section][indexPath.row]
    cell.iConImageView.image = UIImage(named: gasStationMenu.imageName)
    cell.titleLabel.text = gasStationMenu.titleLabel
    cell.selectedLabel.text = gasStationMenu.selectedLabel
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = UIView()
    if section == 0 {
      return nil
    } else {
      return view
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let settingDetailViewControlller = SettingDetailViewController()
    navigationController?.pushViewController(settingDetailViewControlller, animated: true)
  }
}

// MARK:- CollectionView Methods
extension SettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return oils.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellId, for: indexPath) as! AvgAllPriceViewCell
    let oil = self.oils[indexPath.row]
    cell.oil = oil
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = CGSize(width: 100, height: 100)
    return size
  }
}
