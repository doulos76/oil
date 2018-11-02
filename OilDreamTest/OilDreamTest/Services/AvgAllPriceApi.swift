//
//  APIServices.swift
//  OilDreamTest
//
//  Created by dave on 29/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

class AvgAllPriceApi {
  
  // Web request with Codable
  func getAvgAllPrice(completion: @escaping AvgAllPriceResponseCompletion) {
    let avgAllPriceUrlString = AVG_ALL_PRICE + QUERY_OUT_JSON_AND_CODE + OPINET_CODE
    guard let urlRequest = URL(string: avgAllPriceUrlString) else { return }
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      
      guard let data = data else { return }
      let jsonDecoder = JSONDecoder()
      do {
        let avgAllPrice = try jsonDecoder.decode(AvgAllPrice.self, from: data)
        completion(avgAllPrice)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}
