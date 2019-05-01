//
//  SecondViewController.swift
//  TableviewSectionPractics
//
//  Created by CHANGGUEN YU on 01/05/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  let scrollView = UIScrollView()
  var labelMenus: [String] = []
  var labels: [UILabel] = []
  weak var data: PizzaList?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.backgroundColor = .white
    view.addSubview(scrollView)
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    data?.cateforyTitles.forEach {
      self.makeLabel(name: $0, section: true)
      data?.menus[$0]?.forEach {
        self.makeLabel(name: $0.menuName, section: false)
      }
    }
    
    labels.last?.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }
  
  func makeLabel(name: String, section: Bool) {
    labels.append(UILabel())
    let label = labels.last!
    label.text = name
    label.font = UIFont.systemFont(ofSize: 30)
    label.backgroundColor = section ? UIColor.darkGray : UIColor.white
    scrollView.addSubview(label)
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    if labels.count == 1 {
      label.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    } else {
      let forward = labels[labels.count - 2]
      label.topAnchor.constraint(equalTo: forward.bottomAnchor).isActive = true
    }
    
    label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    label.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
  }
}
