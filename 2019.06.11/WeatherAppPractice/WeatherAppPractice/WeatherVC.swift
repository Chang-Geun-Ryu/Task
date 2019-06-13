//
//  ViewController.swift
//  WeatherAppPractice
//
//  Created by CHANGGUEN YU on 11/06/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

//scrollview didscroll

final class WeatherVC: UIViewController {
  var topView: TopView!
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }

  private func configure() {
    topView = TopView(frame: CGRect(x: view.safeAreaInsets.left, y:  view.safeAreaInsets.top, width: view.frame.width, height: 100))
    view.addSubview(topView)
    
    tableView.dataSource = self
    view.addSubview(tableView)
  }

}

extension WeatherVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
    
    return cell!
  }
  
  
}
