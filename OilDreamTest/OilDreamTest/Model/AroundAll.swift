//
//  AroundAll.swift
//  OilDreamTest
//
//  Created by dave76 on 08/11/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

struct AroundAll: Decodable {
  let aroundAllResult: AroundAllResult
  enum CodingKeys: String, CodingKey {
    case aroundAllResult = "RESULT"
  }
}

struct AroundAllResult: Decodable {
  let aroundAllOil: [AroundAllOil]
  enum CodingKeys: String, CodingKey {
    case aroundAllOil = "OIL"
  }
}

struct AroundAllOil: Decodable {
  let uniId: String
  let pollDivCd: String
  let osName: String
  let price: Int
  let distance: Double
  let gisXCoor: Double
  let gisYCoor: Double
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCd = "POLL_DIV_CD"
    case osName = "OS_NM"
    case price = "PRICE"
    case distance = "DISTANCE"
    case gisXCoor = "GIS_X_COOR"
    case gisYCoor = "GIS_Y_COOR"
  }
}
