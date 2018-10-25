//
//  AvgOilPrice.swift
//  OilDreamTest
//
//  Created by dave on 10/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

struct AvgAllPrice: Decodable {
  let result: Result
  enum CodingKeys: String, CodingKey {
    case result = "RESULT"
  }
}

struct Result: Decodable {
  let oils: [Oil]
  enum CodingKeys: String, CodingKey {
    case oils = "OIL"
  }
}

struct Oil: Decodable {
  let tradeDate: String     // 해당일자
  let productCode: String   // 제품 구분 코드
  let productName: String   // 제품명
  let price: String         // 평균가격
  let diff: String          // 전일대비 등락값
  
  enum CodingKeys: String, CodingKey {
    case tradeDate = "TRADE_DT"
    case productCode = "PRODCD"
    case productName = "PRODNM"
    case price = "PRICE"
    case diff = "DIFF"
  }
}
