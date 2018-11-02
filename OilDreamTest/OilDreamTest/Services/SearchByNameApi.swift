//
//  SearchByNameApi.swift
//  OilDreamTest
//
//  Created by dave on 01/11/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import Foundation

class SearchByNameApi {
  func getSearchByName(for name: String, in areaCode: String, completion: @escaping SearchByNameResponseCompletion) {
    let searchByNameUrlString = SEARCH_BY_NAME + QUERY_OUT_JSON_AND_OPINET_CODE + "&osnm=\(name)" + "&area=\(areaCode)"
    guard let url = URL(string: searchByNameUrlString) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        print(3)
        debugPrint(error.debugDescription)
        completion(nil)
        return
      }
      print(4)
      guard let data = data else { return }
      let jsonDecoder = JSONDecoder()
      do {
        let searchByName = try jsonDecoder.decode(SearchByName.self, from: data)
        print("\n=============== [ Search api data ] ================\n")
        completion(searchByName)
      } catch {
        debugPrint(error.localizedDescription)
        completion(nil)
      }
    }
    task.resume()
  }
}
