//
//  AroundAllApi.swift
//  OilDreamTest
//
//  Created by dave76 on 08/11/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

class AroundAllApi {
  func getAroundAll(completion: @escaping AroundAllResponseCompletion) {
    let aroundAllUrlString = "http://www.opinet.co.kr/api/aroundAll.do?code=F365181005&x=314681.8&y=544837&radius=5000&sort=1&prodcd=B027&out=json"
    guard let url = URL(string: aroundAllUrlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      
      guard let data = data else { return }
      let jsonDecoder = JSONDecoder()
      do {
        let aroundAll = try jsonDecoder.decode(AroundAll.self, from: data)
        completion(aroundAll)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}
