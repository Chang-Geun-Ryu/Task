//
//  ViewController.swift
//  NotificationCenterPractics
//
//  Created by CHANGGUEN YU on 30/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

extension ViewController {
  static var setBackgoundColor: Notification.Name {
    return Notification.Name("SetBackGroundColor")
  }
}

class ViewController: UIViewController {
  var sliderArray: [UISlider] = []
  var labelArray: [UILabel] = []
  let controllerNames: [String] = ["Red", "Green", "Blue", "Alpha"]
  
  let textField = UITextField()
  
  let setColorButton = UIButton(type: .system)
  
  let notiCenter = NotificationCenter.default
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    controllerNames.forEach {
      self.sliderArray.append(UISlider())
      self.sliderArray.last?.maximumValue = 255
      self.sliderArray.last?.minimumValue = 0
      self.view.addSubview(sliderArray.last!)
      self.sliderArray.last?.translatesAutoresizingMaskIntoConstraints = false
      
      self.labelArray.append(UILabel())
      self.labelArray.last?.text = $0
      self.labelArray.last?.font = UIFont.systemFont(ofSize: 20)
      self.labelArray.last?.textAlignment = .left
      self.view.addSubview(labelArray.last!)
      self.labelArray.last?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    setColorButton.setTitle("Set Color", for: .normal)
    setColorButton.setTitleColor(.blue, for: .normal)
    setColorButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    setColorButton.addTarget(self, action: #selector(setColor), for: .touchUpInside)
    view.addSubview(setColorButton)
    
    textField.textAlignment = .center
    textField.borderStyle = .roundedRect
    textField.font = UIFont.systemFont(ofSize: 30)
    view.addSubview(textField)
    setNotificationCentor()

    autoLayout()
  }

  func setNotificationCentor() {
    notiCenter.addObserver(self, selector: #selector(setKeyboardWatch(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    notiCenter.addObserver(self, selector: #selector(setKeyboardWatch(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
  }
  
  @objc func setKeyboardWatch(_ noti: Notification) {
    guard let userInfo = noti.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
    
    let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
    
    UIView.animate(withDuration: duration ?? 0) {
      if keyboardFrame.minY >= self.view.frame.maxY {
        self.view.frame.origin.y = 0
      } else {
        self.view.frame.origin.y -= 250
      }
    }
  }
  
  @objc func setColor(_ sender: UIButton) {
    var color:[CGFloat] = []
    color.append(CGFloat(sliderArray[0].value / 255))
    color.append(CGFloat(sliderArray[1].value / 255))
    color.append(CGFloat(sliderArray[2].value / 255))
    color.append(CGFloat(sliderArray[3].value / 255))
    
    notiCenter.post(name: ViewController.setBackgoundColor, object: textField, userInfo: ["BackgoundColor": color])
    print(color)
  }

  func autoLayout() {
    setColorButton.translatesAutoresizingMaskIntoConstraints = false
    textField.translatesAutoresizingMaskIntoConstraints = false
    
    var layoutArray: [NSLayoutConstraint] = []
    layoutArray.append(labelArray[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50))
    layoutArray.append(labelArray[0].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10))
    layoutArray.append(labelArray[0].trailingAnchor.constraint(equalTo: sliderArray[0].leadingAnchor))
    layoutArray.append(labelArray[0].heightAnchor.constraint(equalToConstant: 50))
    
    layoutArray.append(sliderArray[0].topAnchor.constraint(equalTo: labelArray[0].topAnchor))
    layoutArray.append(sliderArray[0].leadingAnchor.constraint(equalTo: labelArray[0].trailingAnchor))
    layoutArray.append(sliderArray[0].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10))
    layoutArray.append(sliderArray[0].heightAnchor.constraint(equalTo: labelArray[0].heightAnchor))
    
    for num in 1...controllerNames.count - 1 {
      layoutArray.append(labelArray[num].topAnchor.constraint(equalTo: labelArray[num - 1].bottomAnchor))
      layoutArray.append(labelArray[num].leadingAnchor.constraint(equalTo: labelArray[num - 1].leadingAnchor))
      layoutArray.append(labelArray[num].trailingAnchor.constraint(equalTo: labelArray[num - 1].trailingAnchor))
      layoutArray.append(labelArray[num].heightAnchor.constraint(equalTo: labelArray[num - 1].heightAnchor))
      
      layoutArray.append(sliderArray[num].topAnchor.constraint(equalTo: sliderArray[num - 1].bottomAnchor))
      layoutArray.append(sliderArray[num].leadingAnchor.constraint(equalTo: sliderArray[0].leadingAnchor))
      layoutArray.append(sliderArray[num].trailingAnchor.constraint(equalTo: sliderArray[0].trailingAnchor))
      layoutArray.append(sliderArray[num].heightAnchor.constraint(equalTo: sliderArray[0].heightAnchor))
    }
    
    NSLayoutConstraint.activate( layoutArray + [
      setColorButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      setColorButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      setColorButton.widthAnchor.constraint(equalToConstant: 150),
      setColorButton.heightAnchor.constraint(equalToConstant: 50),
      
      textField.topAnchor.constraint(equalTo: setColorButton.bottomAnchor, constant: 50),
      textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
      textField.heightAnchor.constraint(equalToConstant: 50)
      ])
  }
}
