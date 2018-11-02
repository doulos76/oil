//
//  AvgSidoPrice.swift
//  OilDreamTest
//
//  Created by dave on 18/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

struct AvgSidoPrice: Decodable {
  let avgSidoPriceResult: AvgSidoPriceResult
  
  enum CodingKeys: String, CodingKey {
    case avgSidoPriceResult = "RESULT"
  }
}

struct AvgSidoPriceResult: Decodable {
  let avgSidoOils: [AvgSidoPriceOil]
  
  enum CodingKeys: String, CodingKey {
    case avgSidoOils = "OIL"
  }
}

struct AvgSidoPriceOil: Decodable {
  let sidoCode: String
  let sidoName: String
  let productCode: ProductCode
  let price: Double
  let diff: Double
  
  enum CodingKeys: String, CodingKey {
    case sidoCode = "SIDOCD"
    case sidoName = "SIDONM"
    case productCode = "PRODCD"
    case price = "PRICE"
    case diff = "DIFF"
  }
}

enum ProductCode: String, Codable {
  case b027 = "B027"
  case b034 = "B034"
  case c004 = "C004"
  case d047 = "D047"
  case k015 = "K015"
}
