//
//  ViewController.swift
//  ButtonShowAnimaiotnPractice
//
//  Created by CHANGGUEN YU on 14/05/2019.
//  Copyright © 2019 유창근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var count = 0
  let buttons = ["버튼1", "버튼2", "버튼3", "버튼4", "버튼5", "버튼6"].compactMap { (title) -> UIButton in
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    return button
  }
  
  let rightButton = ["버튼1", "버튼2", "버튼3", "버튼4", "버튼5"].compactMap { (title) -> UIButton in
    let button = UIButton(type: .system)
    button.setTitle(title, for: .normal)
    return button
  }
  
  var openLeft = true
  var openRight = true
  
  let leftButtonPositionX: Int = 100
  lazy var  rightButtonPositionX = view.frame.width - 100
  

  override func viewDidLoad() {
    super.viewDidLoad()
   
    
    buttons.forEach {
      $0.tag = count
      $0.frame = CGRect(x: 50, y: view.frame.height - 120, width: 80, height: 80)
      $0.addTarget(self, action: #selector(clickButton(_:)), for: .touchUpInside)
      $0.center = CGPoint(x: 100, y: self.view.frame.height - 100)
      self.view.addSubview($0)
      count += 1
    }
    
    count = 0
    rightButton.forEach {
      $0.tag = count
      $0.frame = CGRect(x: 0, y: view.frame.height - 120, width: 80, height: 80)
      $0.addTarget(self, action: #selector(clickRightButton(_:)), for: .touchUpInside)
      $0.center = CGPoint(x: view.frame.width - 100, y: self.view.frame.height - 100)
      self.view.addSubview($0)
      count += 1
    }
  }
  
  @objc func clickRightButton(_ sender: UIButton) {
    count = 0
    if openRight {
      UIView.animateKeyframes(withDuration: 2,
                              delay: 0,
                              options: [.beginFromCurrentState],
                              animations: {
                                self.rightButton.forEach { (button) -> () in
                                  UIView.addKeyframe(withRelativeStartTime: 0.25 * Double(button.tag), relativeDuration: 0.25, animations: {
                                    
                                    for num in (self.count+1)..<self.rightButton.count {
                                      self.rightButton[num].center = CGPoint(x: self.view.frame.width - 100, y: button.center.y - 100)
                                      print("count: \(self.count)")
                                    }
                                    button.transform = CGAffineTransform(scaleX: 1, y: 1)
                                  })
                                  self.count += 1
                                  
                                }
      })
    } else {
      UIView.animateKeyframes(withDuration: 2,
                              delay: 0,
                              options: [.beginFromCurrentState],
                              animations: {
                                for indaxWide in (1..<(self.rightButton.count)).reversed() {
                                  let poritionY = self.rightButton[indaxWide].center.y
                                  for indax in indaxWide..<(self.rightButton.count) {
                                    UIView.addKeyframe(withRelativeStartTime: 0.25 * Double(self.count), relativeDuration: 0.25, animations: {
                                      self.rightButton[indax].center = CGPoint(x: self.view.frame.width - 100, y: poritionY + 100)
                                      self.rightButton[indaxWide].transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                                    })
                                  }
                                  self.count += 1
                                }
      })
//      self.rightButton.forEach { print($0.center.y) }
    }
    
    openRight.toggle()
  }
  
  @objc func clickButton(_ sender: UIButton) {
    count = 0
    if openLeft {
      UIView.animate(withDuration: 0.5) {
        self.buttons.forEach {
          if self.count != 0 {
            $0.center = CGPoint(x: 100, y: $0.center.y - CGFloat(100 * self.count))
            $0.transform = CGAffineTransform(scaleX: 1, y: 1)
          }
          self.count += 1
        }
      }
    } else {
      UIView.animate(withDuration: 0.5) {
        self.buttons.forEach {
          if self.count != 0 {
            $0.center = CGPoint(x: 100, y: self.view.frame.height - 100)
            $0.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
          }
          self.count += 1
        }
      }
    }
    openLeft.toggle()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    count = 0
    buttons.forEach {
      $0.layer.cornerRadius = $0.frame.width / 2
      $0.clipsToBounds = true
      if self.count != 0 {$0.transform = CGAffineTransform(scaleX: 0.3, y: 0.3) }
      self.count += 1
      $0.backgroundColor = UIColor(red: CGFloat.random(in: 0...1.0), green: CGFloat.random(in: 0...1.0), blue: CGFloat.random(in: 0...1.0), alpha: 1)
    }
    
    count = 0
    rightButton.forEach {
      $0.layer.cornerRadius = $0.frame.width / 2
      $0.clipsToBounds = true
      if self.count != 0 {$0.transform = CGAffineTransform(scaleX: 0.3, y: 0.3) }
      self.count += 1
      $0.backgroundColor = UIColor(red: CGFloat.random(in: 0...1.0), green: CGFloat.random(in: 0...1.0), blue: CGFloat.random(in: 0...1.0), alpha: 1)
    }
    
    view.bringSubviewToFront(buttons.first!)
    view.bringSubviewToFront(rightButton.first!)
  }
}
