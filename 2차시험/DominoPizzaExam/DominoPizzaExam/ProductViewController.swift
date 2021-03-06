//
//  ProductViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {
  weak var menus: PizzaList?
  let tableView = UITableView()
  var pizzas: [(String, Int)] = [] // 메뉴리스트 및 가격 정보 저장 프로퍼티
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 120
    view.addSubview(tableView)
    
    autoLayout()
    
    // 선택할 메뉴 리스트와 가격 정보 메뉴 인스턴스에서 추출
    pizzas = menus?.menus[self.title ?? ""]?.map { ($0.menuName, $0.menuPrice)} ?? []
  }
  
  func autoLayout() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
}

extension ProductViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pizzas.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Me") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Me")
    cell.textLabel?.text = "\(pizzas[indexPath.row].0)"
    cell.detailTextLabel?.text = "\(pizzas[indexPath.row].1)"
    cell.imageView?.image = UIImage(named: pizzas[indexPath.row].0)
    cell.accessoryType = .none
    return cell
  }
}

extension ProductViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let dVC = DetailViewController()
    dVC.title = pizzas[indexPath.row].0     // 선택된 메뉴 이름
    dVC.category = self.title ?? ""         // 현재 메뉴 카테고리
    dVC.menu = menus?.menus[self.title ?? ""]?[indexPath.row]     // 선택된 메뉴 인스턴스 주소 복사
    navigationController?.pushViewController(dVC, animated: true)
  }
}
