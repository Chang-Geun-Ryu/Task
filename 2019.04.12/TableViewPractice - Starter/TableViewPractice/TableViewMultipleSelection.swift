//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by 이봉원 on 10/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewMultipleSelection: UIViewController {
  
  /***************************************************
   [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
   
   1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
   2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
      랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
      (여기까지 TableViewRefresh 실습 내용과 동일)
   3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
      (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
      e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
   4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
   
   < 힌트 >
   키워드 - willSelectRow, selectedRow, multipleSelection
   ***************************************************/
    
    let arrayMax = 20
    lazy var data = Array(1...arrayMax)
  
  override var description: String {
    return "Task 1 - MultipleSelection"
  }
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.frame = view.frame
    tableView.dataSource = self
    tableView.delegate = self
    tableView.allowsMultipleSelection = true
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    view.addSubview(tableView)
    
    let refreshControl = UIRefreshControl()
    tableView.refreshControl = refreshControl
    refreshControl.attributedTitle = NSAttributedString(string: "Refresh")
    refreshControl.addTarget(self, action: #selector(randomRefresh), for: .valueChanged)
    
    tableView.addSubview(refreshControl)
  }
    @objc func randomRefresh() {
        data.removeAll()
        
        for selected in tableView.indexPathsForSelectedRows! {
            let strNum = tableView.cellForRow(at: selected)?.textLabel?.text ?? ""
            data.append(Int(strNum)!)
        }
        
        random()
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func random() {
        let numberValue = (1...(50 + arrayMax)).randomElement()
        guard !data.contains(numberValue!) else { return random()}
        data.append(numberValue!)
        guard data.count >= 20 else { return random() }
    }
}

// MARK: - UITableViewDataSource

extension TableViewMultipleSelection: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
    cell.textLabel?.text = "\(data[indexPath.row])"
    return cell
  }
}

extension TableViewMultipleSelection: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let num = Int(tableView.cellForRow(at: indexPath)?.textLabel?.text ?? ""),
         num > 7 else { return nil}
        
        return indexPath
    }
}
