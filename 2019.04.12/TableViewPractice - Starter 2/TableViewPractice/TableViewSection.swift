//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
  
  /***************************************************
   Data :  0 부터  100 사이에 임의의 숫자
   섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
   e.g.
   섹션 0 - 0부터 9까지의 숫자
   섹션 1 - 10부터 19까지의 숫자
   ***************************************************/
  
  override var description: String {
    return "Practice 2 - Section"
  }
  
  let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
//  let data = Array(1...100)
  var numberCategories: [Int: [Int]] = [:]
  var sectionTitles: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    
    for i in data {
      if let _ = numberCategories[i / 10] {
        numberCategories[i / 10]?.append(i)
      } else {
        numberCategories[i / 10] = [i]
      }
    }
    sectionTitles = numberCategories.keys.sorted()
  }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionTitles.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberCategories[sectionTitles[section]]!.count
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "\(sectionTitles[section])"
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    let values = numberCategories[sectionTitles[indexPath.section]]!
    let value = values[indexPath.row]
    cell.textLabel?.text = "\(value)"
    return cell
  }
}
