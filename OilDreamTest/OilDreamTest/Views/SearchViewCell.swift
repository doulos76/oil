//
//  SearchViewCell.swift
//  OilDreamTest
//
//  Created by dave on 04/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class SearchViewCell: UITableViewCell {

  let logoImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.image = #imageLiteral(resourceName: "img")
    return imageView
  }()

  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    let stackView = UIStackView(arrangedSubviews: [logoImageView, titleLabel, UIView()])
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 12
    titleLabel.text = "Profile"
    stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.layoutMargins = .init(top: 8, left: 12, bottom: 8, right: 12)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
