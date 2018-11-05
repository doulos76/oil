//
//  AreaCode.swift
//  OilDreamTest
//
//  Created by dave on 27/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

struct AreaCode: Decodable {
  let result: AreaCodeResult

  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct AreaCodeResult: Decodable {
  let oil: [AreaCodeOil]

  enum CodingKeys: String, CodingKey {
    case oil = "OIL"
  }
}

struct AreaCodeOil: Decodable {
  let areaCode: String    // 지역코드
  let areaName: String    // 지역이름

  enum CodingKeys: String, CodingKey {
    case areaCode = "AREA_CD"
    case areaName = "AREA_NM"
  }
}
