//
//  TopView.swift
//  WeatherForecast
//
//  Created by CHANGGUEN YU on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//


import UIKit

protocol ReloadButtonClicked {
  func reload(_ sender: UIButton)
}

final class TopView: UIView {
  let locationLabel = UILabel()
  let timeLabel = UILabel()
  let reloadButton = UIButton(type: .system)
  
  var delegate: ReloadButtonClicked?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
//    print(frame)
    
  }
  override func didMoveToSuperview() {  // superview에
//    print("super:\(superview)")
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configure()
  }
  
  private func configure() {
    locationLabel.text = "location"
    locationLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    locationLabel.textColor = .white
    addSubview(locationLabel)
    
    timeLabel.text = "time"
    timeLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
    timeLabel.textColor = .white
    addSubview(timeLabel)
    
    reloadButton.setTitle("↻", for: .normal)
    reloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    reloadButton.setTitleColor(.white, for: .normal)
    reloadButton.addTarget(self, action: #selector(reload(_:)), for: .touchUpInside)
    addSubview(reloadButton)
    
    autolayout()
  }
  
  @objc private func reload(_ sender: UIButton) {
    delegate?.reload(sender)
  }
  
  private func autolayout() {
    locationLabel.translatesAutoresizingMaskIntoConstraints = false
    locationLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    timeLabel.translatesAutoresizingMaskIntoConstraints = false
    timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    reloadButton.translatesAutoresizingMaskIntoConstraints = false
    reloadButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    reloadButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  func setLocation(address: String) {
    locationLabel.text = address
    
    let dateFormat = DateFormatter()
    
    dateFormat.locale = Locale(identifier: "ko_kr")
    dateFormat.timeZone = TimeZone(identifier: "KST")
    
    dateFormat.dateFormat = "a h:mm"
    timeLabel.text = dateFormat.string(from: Date())
  }
  
  func setRotationAnimation() {
    UIView.animateKeyframes(withDuration: 1
      , delay: 0
      , animations: {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33, animations: {
          self.reloadButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0 / 3.0)
        })
        UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33, animations: {
          self.reloadButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0 / 3.0 * 2.0)
        })
        UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.34, animations: {
          self.reloadButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0 / 3.0 * 3.0)
        })
    }) { _ in
      self.reloadButton.transform = .identity
    }
  }
}
