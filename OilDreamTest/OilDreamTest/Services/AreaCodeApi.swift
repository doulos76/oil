//
//  AreaCodeApi.swift
//  OilDreamTest
//
//  Created by dave on 30/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation
import Alamofire

class AreaCodeApi {
  func getAreaCode(areaCD: Int = 0, completion: @escaping AreaCodeResponseCompletion) {
    let areaCodeUrlString = AREA_CODE + QUERY_OUT_JSON_AND_OPINET_CODE + "&area=0\(areaCD)"
    guard let url = URL(string: areaCodeUrlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      guard let data = data else { return }
      do {
        let jsonDecoder = JSONDecoder()
        let areaCode = try jsonDecoder.decode(AreaCode.self, from: data)
        DispatchQueue.main.async {
          completion(areaCode)
        }
      } catch let error {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}
