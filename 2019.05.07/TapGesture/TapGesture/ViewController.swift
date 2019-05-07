//
//  ViewController.swift
//  TapGesture
//
//  Created by CHANGGUEN YU on 07/05/2019.
//  Copyright © 2019 유창근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let touchCountLabel = UILabel()
  let touchCoardinateLabel = UILabel()
  
  var firstTouchPooint = CGPoint(x: 0, y: 0)
  var touchCounting = 0
  
  let formetter = Formatter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    touchCountLabel.text = "횟수 : "
    touchCountLabel.font = UIFont.systemFont(ofSize: 30)
    touchCountLabel.textColor = .black
    touchCountLabel.textAlignment = .left
    view.addSubview(touchCountLabel)
    
    touchCoardinateLabel.text = "좌표 : (0.0, 0.0)"
    touchCoardinateLabel.font = UIFont.systemFont(ofSize: 20)
    touchCoardinateLabel.textColor = .black
    touchCoardinateLabel.textAlignment = .left
    view.addSubview(touchCoardinateLabel)
    
    autolayout()
    
    tapGestureSetting()
  }
  
  func tapGestureSetting() {
    let touchGesture = UITapGestureRecognizer(target: self, action: #selector(tabGesture(_:)))
    touchGesture.numberOfTapsRequired = 1
    touchGesture.numberOfTouchesRequired = 1
    view.addGestureRecognizer(touchGesture)
  }

  func autolayout() {
    touchCountLabel.translatesAutoresizingMaskIntoConstraints = false
    touchCountLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    touchCountLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    touchCountLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    touchCountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    touchCoardinateLabel.translatesAutoresizingMaskIntoConstraints = false
    touchCoardinateLabel.topAnchor.constraint(equalTo: touchCountLabel.bottomAnchor).isActive = true
    touchCoardinateLabel.leadingAnchor.constraint(equalTo: touchCountLabel.leadingAnchor).isActive = true
    touchCoardinateLabel.trailingAnchor.constraint(equalTo: touchCountLabel.trailingAnchor).isActive = true
    touchCoardinateLabel.heightAnchor.constraint(equalTo: touchCountLabel.heightAnchor).isActive = true
  }
  
  @objc func tabGesture(_ sender: UITapGestureRecognizer) {
//    print("gesture")
//    sender.
    let touchPoint = sender.location(in: self.view)
    if abs(firstTouchPooint.x - touchPoint.x) >= 10 || abs(firstTouchPooint.y - touchPoint.y) >= 10 {
      touchCounting = 0
      print("초기화", abs(firstTouchPooint.x - touchPoint.x), abs(firstTouchPooint.y - touchPoint.y))
    }
    
    if touchCounting == 0 {
      firstTouchPooint = touchPoint
    }
    
    touchCounting += 1
    
    updateTouched(counting: touchCounting, position: touchPoint)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    /*
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    
    if abs(firstTouchPooint.x - touchPoint.x) >= 10 || abs(firstTouchPooint.y - touchPoint.y) >= 10 {
      touchCounting = 0
      print("초기화", abs(firstTouchPooint.x - touchPoint.x), abs(firstTouchPooint.y - touchPoint.y))
    }
    
    if touchCounting == 0 {
      firstTouchPooint = touchPoint
    }
    
    touchCounting += 1
    updateTouched(counting: touchCounting, position: touchPoint)
 */
  }
  
  func updateTouched(counting: Int, position: CGPoint) {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 1
    let positionX = formatter.string(from: position.x as NSNumber) ?? "0"
    let positionY = formatter.string(from: position.y as NSNumber) ?? "0"
    
    touchCountLabel.text = "횟수 : \(touchCounting)"
    touchCoardinateLabel.text = "좌표 : (\(positionX), \(positionY))"
  }
}
