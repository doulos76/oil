//
//  AreaCode.swift
//  OilDreamTest
//
//  Created by dave on 27/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

struct AreaCode: Decodable {
  let areaCodeResult: AreaCodeResult
  
  enum CodingKeys: String, CodingKey {
    case areaCodeResult = "RESULT"
  }
}

struct AreaCodeResult: Decodable {
  let areaCodeOils: [AreaCodeOil]
  
  enum CodkingKeys: String, CodingKey {
    case areaCodeOils = "OIL"
  }
}

struct AreaCodeOil: Decodable {
  let areaCode: Int
  let areaName: String
  
  enum CodingKeys: String, CodingKey {
    case areaCode = "AREA_CD"
    case areaName = "AREA_NM"
  }
}
