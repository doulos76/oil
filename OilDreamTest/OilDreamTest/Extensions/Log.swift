//
//  Log.swift
//  OilDreamTest
//
//  Created by dave76 on 08/11/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

func DEBUG_LOG(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
  #if DEBUG
    let filename = file.split(separator: "/").last ?? ""
    let funcName = function.split(separator: "(").first ?? ""
    print("👻 [\(filename)] \(funcName)(\(line)): \(message)")
  #endif
}

func ERROR_LOG(_ message: Any, file: String = #file, function: String = #function, line: Int = #line) {
  #if DEBUG
  let filename = file.split(separator: "/").last ?? ""
  let funcName = function.split(separator: "(").first ?? ""
  print("😡 [\(filename)] \(funcName)(\(line)): \(message)")
  #endif
}
