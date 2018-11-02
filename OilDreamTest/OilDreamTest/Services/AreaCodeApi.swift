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
  func getAreaCode(completion: @escaping AreaCodeResponseCompletion) {
    let areaCodeUrlString = AREA_CODE + QUERY_OUT_JSON_AND_OPINET_CODE// + "&area=01"
    guard let url = URL(string: areaCodeUrlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      guard let data = data else { return }
//      print(String(data: data, encoding: .utf8))
      do {
        let areaCode = try JSONDecoder().decode(AreaCode.self, from: data)
        print(areaCode)
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
