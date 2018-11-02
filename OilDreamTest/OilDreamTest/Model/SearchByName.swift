//
//  SearchByName.swift
//  OilDreamTest
//
//  Created by dave on 01/11/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

struct SearchByName: Codable {
  let searchByNameResult: SearchByNameResult
  enum CodingKeys: String, CodingKey {
    case searchByNameResult = "RESULT"
  }
}

struct SearchByNameResult: Codable {
  let searchByNameOils: [SearchByNameOil]
  enum CodingKeys: String, CodingKey {
    case searchByNameOils = "OIL"
  }
}

struct SearchByNameOil: Codable {
  let uniId: String
  let pollDivCode: String
  let gpllDivCode: String
  let oilStationName: String
  let vanAddress: String
  let newAddress: String
  let sugunCode: String
  let isLpgYN: String
  let gisXCoor: String
  let gisYCoor: String
  
  enum CodingKeys: String, CodingKey {
    case uniId = "UNI_ID"
    case pollDivCode = "POLL_DIV_CD"
    case gpllDivCode = "GPOLL_DIV_CD"
    case oilStationName = "OS_NM"
    case vanAddress = "VAN_ADR"
    case newAddress = "NEW_ADR"
    case sugunCode = "SIGUNCD"
    case isLpgYN = "LPG_YN"
    case gisXCoor = "GIS_X_COOR"
    case gisYCoor = "GIS_Y_COOR"
  }
}
