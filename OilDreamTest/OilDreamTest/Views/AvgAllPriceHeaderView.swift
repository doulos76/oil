//
//  AvgAllPriceHeaderView.swift
//  OilDreamTest
//
//  Created by dave on 13/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class AvgAllPriceHeaderView: UIView {
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .blue
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  let avgAllPrice: AvgAllPrice? = nil
  
  let avgAllPriceLabel: UILabel = {
    let label = UILabel()
    label.text = "전국 평균"
    label.font = .systemFont(ofSize: 20)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.text = "2018.10.03"
    label.font = .systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let productNameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "휘발유"
    label.font = .systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "1659.94"
    label.font = .systemFont(ofSize: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let diffLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "0.07"
    label.font = .systemFont(ofSize: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = UIColor.naviBarCustomYellow
    setupAllPriceView()
    print("Setting all price header view")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupAllPriceView() {
    
    addSubview(avgAllPriceLabel)
    addSubview(dateLabel)
    addSubview(collectionView)
    
    avgAllPriceLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    avgAllPriceLabel.heightAnchor.constraint(equalToConstant: 20)
    avgAllPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    avgAllPriceLabel.widthAnchor.constraint(equalTo: dateLabel.widthAnchor).isActive = true
    
    dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    dateLabel.bottomAnchor.constraint(equalTo: avgAllPriceLabel.bottomAnchor).isActive = true
    dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    
    collectionView.topAnchor.constraint(equalTo: avgAllPriceLabel.bottomAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
  }

}
