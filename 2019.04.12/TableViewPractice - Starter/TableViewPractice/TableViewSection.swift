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
  
//  let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
  let data = Array(1...100)
    
    let sectionTitle = Array(0...9)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
  }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    print(section, data.filter() { $0 < (10 + 10 * section) && $0 >= (10 * section) }.count)
    let mapa = data.map() { $0 < (10 + 10 * section) && $0 >= (10 * section)}.count
    print("a", mapa)
    return data.filter() { $0 < (10 + 10 * section) && $0 >= (10 * section) }.count
  }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sectionTitle[section])"
    }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
   
    print(data.map() { $0 < (10 + 10 * indexPath.section) && $0 >= (10 * indexPath.section)}.count)
        cell.textLabel?.text = "\(data[indexPath.row + indexPath.section * data.filter() { $0 < (10 + 10 * indexPath.section) && $0 >= (10 * indexPath.section) - 1 }.count])"

    return cell
  }
}
