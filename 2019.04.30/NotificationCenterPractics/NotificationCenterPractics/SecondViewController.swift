//
//  SecondViewController.swift
//  NotificationCenterPractics
//
//  Created by CHANGGUEN YU on 30/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  let textLabel = UILabel()
  
  let notiCenter = NotificationCenter.default
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    textLabel.textAlignment = .center
    textLabel.font = UIFont.systemFont(ofSize: 55)
    view.addSubview(textLabel)
    
    textLabel.translatesAutoresizingMaskIntoConstraints = false
    textLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    textLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
  }
  
  func setNotificationCentor() {
    notiCenter.addObserver(self, selector: #selector(didReceiveSetBackGroundColor(_:)),
                           name: ViewController.setBackgoundColor,
                           object: nil)
  }
  
  @objc func didReceiveSetBackGroundColor(_ sender: Notification) {
    guard let colorInfo = sender.userInfo as? [String: [CGFloat]] else { return }
    
    let color = colorInfo["BackgoundColor"]!
    view.backgroundColor = UIColor(red: color[0], green: color[1], blue: color[2], alpha: color[3])
    print(color)
    guard let textfield = sender.object as? UITextField else { return }
    
    textLabel.text = textfield.text
    
    print(textfield.text)
  }
}
