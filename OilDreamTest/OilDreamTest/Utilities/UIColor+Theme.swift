//
//  UIColor+Theme.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

extension UIColor {
  // Navigation Bar Color Setting
  static let naviBarCustomYellow = UIColor(red: 255 / 255, green: 229 / 255, blue: 99 / 255, alpha: 1.0)

  // Color Setting Method easily
  static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
  }
}
