//
//  SettingsViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  var avgAllPriceHeaderView: AvgAllPriceHeaderView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.title = "설정"
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(handleCancel))
    
    avgAllPriceHeaderView = AvgAllPriceHeaderView()
    view.addSubview(avgAllPriceHeaderView!)
    avgAllPriceHeaderView?.translatesAutoresizingMaskIntoConstraints = false
    avgAllPriceHeaderView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    avgAllPriceHeaderView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    avgAllPriceHeaderView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    avgAllPriceHeaderView?.heightAnchor.constraint(equalToConstant: 180).isActive = true
    
    showAvgAllPrice()
    
  }
  
  
  func showAvgAllPrice() {
    let avgAllPriceUrlString = AVG_ALL_PRICE + QUERY_OUT_JSON_AND_CODE + OPINET_CODE
    guard let urlRequest = URL(string: avgAllPriceUrlString) else { return }
    print("=============")
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      if let err = error {
        print(err.localizedDescription)
        return
      }
      guard let data = data else { return }
      do {
        let avgAllPrice = try JSONDecoder().decode(AvgAllPrice.self, from: data)
        print(avgAllPrice)
        
//        DispatchQueue.main.async {
//          
//        }
        
        
      } catch let jsonErr {
        print(jsonErr.localizedDescription)
      }
    }.resume()
  }
  
  @objc func handleCancel() {
    dismiss(animated: true, completion: nil)
  }

}
