//
//  InsetLabel.swift
//  OilDreamTest
//
//  Created by dave on 29/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class InsetLabel: UILabel {
  private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
  
  override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
