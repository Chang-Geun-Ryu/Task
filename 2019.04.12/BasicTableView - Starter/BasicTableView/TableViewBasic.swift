//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by 이봉원 on 09/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String {
    return "TableView - Basic"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let tableView = UITableView(frame: view.frame)
    tableView.dataSource = self
    view.addSubview(tableView)
    
    // register - 재활용할 셀의 클래스 미리등록
    // 새로운 아이디 - 새로등록
    // 같은 아이디 - 이전에 등록한 클래스 업데이트
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
    
//    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "CallId")
    
//    tableView.register(UI, forCellReuseIdentifier: <#T##String#>)
  }
}

extension TableViewBasic: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1. 셀 생성
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        //2. 재사용
//        let cell: UITableViewCell
//        tableView.dequ
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellId") {
//            cell = reusableCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "CellId")
//        }
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        //3. register 메서드를 사용하여 미리 셀등록 가능
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
}



