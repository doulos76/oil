//
//  UIView+Extensions.swift
//  OilDreamTest
//
//  Created by dave on 26/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

extension UIView {
  
  /// Auto layout Custom Method
  ///
  /// - Parameters:
  ///   - top: Top NSLayoutYAxisAnchor
  ///   - bottom: Bottom NSLayoutYAxisAnchor
  ///   - leading: Leading NSLayoutXAxisAnchor
  ///   - trailing: Trailing NSLayoutXAxisAnchor
  ///   - paddingTop: Top Padding CGFloat
  ///   - paddingBottom: Bottom Padding CGFloat
  ///   - paddingLeading: Leading Padding CGFloat
  ///   - paddingTrailing: Trailing Padding CGFloat
  ///   - width: Width CGFloat
  ///   - height: Height CGFloat
  func anchor(top: NSLayoutYAxisAnchor?,
              bottom: NSLayoutYAxisAnchor?,
              leading: NSLayoutXAxisAnchor?,
              trailing: NSLayoutXAxisAnchor?,
              paddingTop: CGFloat,
              paddingBottom: CGFloat,
              paddingLeading: CGFloat,
              paddingTrailing: CGFloat,
              width: CGFloat,
              height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    if let top = top {
      self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    if let bottom = bottom {
      self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
    }
    if let leading = leading {
      self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
    }
    if let trailing = trailing {
      self.trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
    }
    if width != 0 {
      self.widthAnchor.constraint(equalToConstant: width)
    }
    if height != 0 {
      self.heightAnchor.constraint(equalToConstant: height)
    }
  }
}
