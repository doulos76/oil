//
//  ButtomBarView.swift
//  OilDreamTest
//
//  Created by dave on 04/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class CustomButtom: UIButton {
  override var intrinsicContentSize: CGSize {
    return CGSize(width: 48, height: 48)
  }
}

class BottomBarView: UIView {
  var currentLocationButton: CustomButtom? = {
    let button = CustomButtom()
    button.setImage(UIImage(named: "currentGPS"), for: .normal)
    button.tintColor = .darkGray
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  var closeButton: CustomButtom? = {
    let button = CustomButtom()
    button.setImage(UIImage(named: "closeButton"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tintColor = .darkGray
    return button
  }()

  var listButton: CustomButtom? = {
    let button = CustomButtom()
    button.setImage(UIImage(named: "list"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tintColor = .darkGray
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .naviBarCustomYellow
    setupStackView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
//  func configureView() {
//    backgroundColor = .green
//    addSubview(currentLocationButton!)
//    addSubview(listButton!)
//    addSubview(closeButton!)
//  }
  
  func setupStackView() {
//    let rightSpaceView = UIView()
    let arrangedSubViews = [
      currentLocationButton, listButton, closeButton
    ]
    
    let stackView = UIStackView(arrangedSubviews: arrangedSubViews as! [UIView])
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    
    stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
}
