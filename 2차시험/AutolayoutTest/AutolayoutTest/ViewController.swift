//
//  ViewController.swift
//  AutolayoutTest
//
//  Created by CHANGGUEN YU on 26/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var greenView: UIView!
  @IBOutlet weak var yellowView: UIView!
  @IBOutlet weak var orangeView: UIView!
  
  let skyView = UIView()
  let blueView = UIView()
  let forthLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    skyView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    blueView.backgroundColor = .blue
    
    view.addSubview(skyView)
    skyView.addSubview(blueView)
    
    forthLabel.text = "네번째 문제"
    forthLabel.font = UIFont.systemFont(ofSize: 23)
    forthLabel.backgroundColor = .white
    view.addSubview(forthLabel)
    
    skyView.translatesAutoresizingMaskIntoConstraints = false
    skyView.topAnchor.constraint(equalTo: yellowView.bottomAnchor).isActive = true
    skyView.leadingAnchor.constraint(equalTo: orangeView.trailingAnchor).isActive = true
    skyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    skyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    blueView.translatesAutoresizingMaskIntoConstraints = false
    blueView.centerXAnchor.constraint(equalTo: skyView.centerXAnchor).isActive = true
    blueView.centerYAnchor.constraint(equalTo: skyView.centerYAnchor).isActive = true
    blueView.widthAnchor.constraint(equalTo: skyView.widthAnchor, multiplier: 0.5).isActive = true
    blueView.heightAnchor.constraint(equalTo: skyView.heightAnchor, multiplier: 0.5).isActive = true
    
    forthLabel.translatesAutoresizingMaskIntoConstraints = false
    forthLabel.centerYAnchor.constraint(equalTo: blueView.centerYAnchor).isActive = true
    forthLabel.centerXAnchor.constraint(equalTo: blueView.centerXAnchor, constant: 20).isActive = true
//    forthLabel.widthAnchor.constraint(lessThanOrEqualTo: blueView.widthAnchor, multiplier: 0.7).isActive = true
    forthLabel.widthAnchor.constraint(greaterThanOrEqualTo: blueView.widthAnchor, multiplier: 0.7).isActive = true
  }


}

