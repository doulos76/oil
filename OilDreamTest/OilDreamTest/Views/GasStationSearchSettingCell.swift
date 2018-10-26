//
//  GasStationSearchSettingCell.swift
//  OilDreamTest
//
//  Created by dave on 26/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class GasStationSearchSettingCell: UITableViewCell {
  let iConImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "img")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Title"
    label.font = .systemFont(ofSize: 14)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let selectedLabel: UILabel = {
    let label = UILabel()
    label.text = "Selected"
    label.font = .systemFont(ofSize: 14)
    label.textColor = .darkGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews() {
    accessoryType = .disclosureIndicator
    addSubview(iConImageView)
    iConImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
    iConImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    iConImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
    iConImageView.heightAnchor.constraint(equalTo: iConImageView.widthAnchor).isActive = true
    
    addSubview(titleLabel)
    titleLabel.leadingAnchor.constraint(equalTo: iConImageView.trailingAnchor, constant: 16).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
    addSubview(selectedLabel)
    selectedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    selectedLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    selectedLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    selectedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
}
