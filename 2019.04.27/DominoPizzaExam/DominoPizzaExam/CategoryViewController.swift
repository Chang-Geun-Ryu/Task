//
//  ViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
  let tableView = UITableView()
  
  let menus = PizzaList()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CategoryCell.self, forCellReuseIdentifier: "Ca")
    view.addSubview(tableView)
    
    let header = UIImageView(image: UIImage(named: "logo"))
    header.contentMode = .scaleAspectFit
    header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
    header.backgroundColor = .white
    tableView.tableHeaderView = header
    tableView.rowHeight = 100
    
    self.title = "Domino's"
    
    autoLayout()
  }
  
  func autoLayout() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
}

extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menus.cateforyTitles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Ca", for: indexPath) as! CategoryCell
    cell.setImage(imageName: menus.cateforyTitles[indexPath.row])
    return cell
  }
}

extension CategoryViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pVC = ProductViewController()
    pVC.title = menus.cateforyTitles[indexPath.row]
    pVC.menus = menus
    navigationController?.pushViewController(pVC, animated: true)
  }
}
