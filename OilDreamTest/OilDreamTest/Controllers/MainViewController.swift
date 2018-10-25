//
//  ViewController.swift
//  OilDreamTest
//
//  Created by dave on 03/10/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

class MainViewController: UIViewController {
  
  var mapView: MKMapView = {
    let map = MKMapView()
    map.translatesAutoresizingMaskIntoConstraints = false
    return map
  }()
  
  var bottomBarView = BottomBarView()
  
  private let locationManager = CLLocationManager()

  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    view.backgroundColor = .white
    
    setupNavigationBarUI()
    setupUI()

  }
  
  func setupNavigationBarUI() {
    navigationItem.title = "오일 드림"
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(handleSettings))
  }
  
  fileprivate func setupUI() {
    view.addSubview(mapView)
    view.addSubview(bottomBarView)
    
    mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: bottomBarView.topAnchor).isActive = true
    mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    bottomBarView.translatesAutoresizingMaskIntoConstraints = false
    bottomBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    bottomBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    bottomBarView.heightAnchor.constraint(equalToConstant: 100).isActive = true

  }
  
  @objc func handleSearch() {
    let searchViewController = SearchViewController()
    let navigationController = CustomNavigationController(rootViewController: searchViewController)
    present(navigationController, animated: true, completion: nil)
  }
  
  @objc func handleSettings() {
    let settingsViewController = SettingsViewController()
    let navigationController = CustomNavigationController(rootViewController: settingsViewController)
    present(navigationController, animated: true, completion: nil)
  }
  
}

extension MainViewController: CLLocationManagerDelegate {
  
}
