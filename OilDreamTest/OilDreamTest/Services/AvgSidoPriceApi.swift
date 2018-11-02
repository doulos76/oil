//
//  AvgSidoPriceApi.swift
//  OilDreamTest
//
//  Created by dave on 30/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

class AvgSidoPriceApi {
  func getAvgSidoPrice(completion: @escaping AvgSidoPriceResponseCompletion) {
    let avgSidoPriceUrlString = AVG_SIDO_PRICE + QUERY_OUT_JSON_AND_OPINET_CODE
    guard let url = URL(string: avgSidoPriceUrlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      guard let data = data else { return }
      let jsonDecoder = JSONDecoder()
      do {
        let avgSidoPrice = try jsonDecoder.decode(AvgSidoPrice.self, from: data)
        completion(avgSidoPrice)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}

