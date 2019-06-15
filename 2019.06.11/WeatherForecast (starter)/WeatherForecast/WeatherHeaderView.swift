//
//  WeatherHeaderView.swift
//  WeatherForecast
//
//  Created by CHANGGUEN YU on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class WeatherHeaderView: UIView {
  
  let dayWeatherImageView = UIImageView()
  let skyNameLabel = UILabel()
  let weaderMinMaxLabel = UILabel()
  let temperatureLabel = UILabel()
  
  let view = UIView()
  
  let numformat = NumberFormatter()

  var viewConstraint: NSLayoutConstraint!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  private func configure() {
    numformat.numberStyle = .decimal
    numformat.minimumFractionDigits = 0
    numformat.maximumFractionDigits = 1
    
    backgroundColor = .clear
    
    
    view.backgroundColor = .clear
    addSubview(view)
    
    temperatureLabel.text = "기온"
    temperatureLabel.font = UIFont.systemFont(ofSize: 100, weight: .light)
    temperatureLabel.textColor = .white
    view.addSubview(temperatureLabel)
    
    weaderMinMaxLabel.text = "최저, 최고 기온"
    weaderMinMaxLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
    weaderMinMaxLabel.textColor = .white
    view.addSubview(weaderMinMaxLabel)
    
    skyNameLabel.text = "맑음"
    skyNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    skyNameLabel.textColor = .white
    view.addSubview(skyNameLabel)
    
    dayWeatherImageView.image = UIImage(named: "SKY_01")
    dayWeatherImageView.contentMode = .scaleAspectFill
    
    view.addSubview(dayWeatherImageView)
    
    autolayout()
  }
  
  private func autolayout() {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
    viewConstraint = view.centerXAnchor.constraint(equalTo: centerXAnchor)
    viewConstraint.isActive = true
    view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    temperatureLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    temperatureLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    
    weaderMinMaxLabel.translatesAutoresizingMaskIntoConstraints = false
    weaderMinMaxLabel.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -10).isActive = true
    weaderMinMaxLabel.leftAnchor.constraint(equalTo: temperatureLabel.leftAnchor).isActive = true
    
    dayWeatherImageView.translatesAutoresizingMaskIntoConstraints = false
    dayWeatherImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    dayWeatherImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    dayWeatherImageView.leftAnchor.constraint(equalTo: weaderMinMaxLabel.leftAnchor).isActive = true
    dayWeatherImageView.bottomAnchor.constraint(equalTo: weaderMinMaxLabel.topAnchor, constant: -5).isActive = true

    skyNameLabel.translatesAutoresizingMaskIntoConstraints = false
    skyNameLabel.leftAnchor.constraint(equalTo: dayWeatherImageView.rightAnchor, constant: 5).isActive = true
    skyNameLabel.bottomAnchor.constraint(equalTo: weaderMinMaxLabel.topAnchor).isActive = true
  }
  
  func setWeatherInfo(temperature: String, temperatureMin: String, temperatureMax: String, skyName: String, image: String) {
    self.temperatureLabel.text = temperature + "˚"
    self.weaderMinMaxLabel.text = "⤓ \(temperatureMin + "˚") ⤒ \(temperatureMax + "˚")"
    self.skyNameLabel.text = skyName
    
    var skyImage = image
    skyImage.remove(at: skyImage.index(skyImage.startIndex, offsetBy: 4))
    self.dayWeatherImageView.image = UIImage(named: skyImage)
  }
  
  func temperatureAnimation() {

    self.view.alpha = 0
    UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.01, animations: {
        self.viewConstraint.constant += 300
        
        self.view.layoutIfNeeded()
        self.layoutIfNeeded()
      })
      UIView.addKeyframe(withRelativeStartTime: 0.01, relativeDuration: 0.99, animations: {
        self.viewConstraint.constant -= 300
        self.view.alpha = 1
        self.view.layoutIfNeeded()
        self.layoutIfNeeded()
      })
    })
  }
}
