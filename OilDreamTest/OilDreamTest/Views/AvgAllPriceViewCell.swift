//
//  AvgAllPriceViewCell.swift
//  OilDreamTest
//
//  Created by dave on 13/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class AvgAllPriceViewCell: UICollectionViewCell {
  

  var oil: AvgAllPriceOil! {
    didSet {
      productNameLabel.text = oil.productName
      priceLabel.text = oil.price
      diffLabel.text = oil.diff
    }
  }
  
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
    let arrangedSubviews = [productNameLabel, priceLabel, diffLabel]
    let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
