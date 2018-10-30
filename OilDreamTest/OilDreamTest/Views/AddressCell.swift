//
//  AddressCell.swift
//  OilDreamTest
//
//  Created by dave on 29/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class AddressCell: UICollectionViewCell {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "서울"
    label.textColor = .darkGray
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.isUserInteractionEnabled = true
    return label
  }()
  
//  let titleButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.setTitle("서울", for: .normal)
//    button.setTitleColor(.darkGray, for: .normal)
//    return button
//  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 1
    addSubview(titleLabel)
    titleLabel.anchor(top: topAnchor, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
  }
  
}
