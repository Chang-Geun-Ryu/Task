//
//  ViewController.swift
//  WeatherForecast
//
//  Created by giftbot on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit
import MapKit

final class WeatherVC: UIViewController {
  private var topView: TopView!
  private var weatherHeaderView: WeatherHeaderView!
  private let backgroundImageView = UIImageView()
  private let backgroundImageViewAnimate = UIImageView()
  private var blurEffectView: UIVisualEffectView!
  
  private let tableView = UITableView()
  private let numformat = NumberFormatter()
  
  private let cellHeight: CGFloat = 60
  private var fcstThreeHour: [(String, String, String, String, String)] = []
  private var imageCounter = 1
  
  private var backgoundLeftConstraint: NSLayoutConstraint!
  private var backgoundRightConstraint: NSLayoutConstraint!
  
  private let locationManager = CLLocationManager()
  
  private var latitude = ""
  private var longitude = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.delegate = self
    checkAuthorizationStatus()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    configure()
    autolayout()
    
    
  }
  
  private func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied:
      break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startingUpdatingLocation()
      break
    @unknown default: break
    }
  }
  
  private func startingUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedAlways || status == .authorizedWhenInUse, CLLocationManager.locationServicesEnabled() else { return }
    
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters // 10 meter 마다
    locationManager.distanceFilter = 1000.0                                 //
    locationManager.startUpdatingLocation()
  }
  
  private func configure() {
    numformat.numberStyle = .decimal
    numformat.minimumFractionDigits = 0
    numformat.maximumFractionDigits = 1
    
    backgroundImageView.alpha = 1
    backgroundImageView.image = getBackgroundImage()
    backgroundImageView.contentMode = .scaleAspectFill
    view.addSubview(backgroundImageView)
    
    backgroundImageViewAnimate.alpha = 0
    backgroundImageViewAnimate.image = getBackgroundImage()
    backgroundImageViewAnimate.contentMode = .scaleAspectFill
    view.addSubview(backgroundImageViewAnimate)
    
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    blurEffectView.alpha = 0
    view.addSubview(blurEffectView)
    
    topView = TopView(frame: CGRect(x: view.safeAreaInsets.left, y:  view.safeAreaInsets.top, width: view.frame.width, height: 0))
    topView.delegate = self
    view.addSubview(topView)
    
    weatherHeaderView = WeatherHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 130))
    tableView.tableHeaderView = weatherHeaderView
    tableView.rowHeight = cellHeight
    tableView.register(UINib(nibName: "WeatherInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
    tableView.separatorStyle = .none
    tableView.backgroundColor = .clear
    tableView.dataSource = self
    tableView.delegate = self
    view.addSubview(tableView)
  }
  
  private func autolayout() {
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backgoundLeftConstraint = backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -60) //.isActive = true
    backgoundLeftConstraint.isActive = true
    backgoundRightConstraint = backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor)//.isActive = true
    backgoundRightConstraint.isActive = true
    backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    backgroundImageViewAnimate.translatesAutoresizingMaskIntoConstraints = false
    backgroundImageViewAnimate.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backgroundImageViewAnimate.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor).isActive = true
    backgroundImageViewAnimate.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor).isActive = true
    backgroundImageViewAnimate.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    blurEffectView.translatesAutoresizingMaskIntoConstraints = false
    blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    blurEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    blurEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    topView.translatesAutoresizingMaskIntoConstraints = false
    topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  private func getBackgroundImage() -> UIImage {
    let image = UIImage(named: "\(imageCounter)")!
//    print("image",imageCounter)
    imageCounter = imageCounter < 4 ? imageCounter + 1 : 1
    return image
  }
  
  private func getTimeAfter(now: Date, dateFormatter: DateFormatter, dayString: inout String, timeString: inout String) {
//    let dateFormat = DateFormatter()
    
//    dateFormatter.locale = Locale(identifier: "en_US")
//    dateFormat.timeZone = TimeZone(identifier: "UST")
    
    dateFormatter.dateFormat = "M.dd (EEE)"
    dayString = dateFormatter.string(from: now)
    
    dateFormatter.dateFormat = "HH:00"
    timeString = dateFormatter.string(from: now)
  }
  
  private func changeBackgroundImage() {
    DispatchQueue.global().async {
      Thread.sleep(forTimeInterval: 1)
      
      DispatchQueue.main.async {
        self.backgroundImageView.image = self.backgroundImageViewAnimate.image
        self.backgroundImageView.alpha = 1
        self.backgroundImageViewAnimate.alpha = 0
        
        self.backgroundImageViewAnimate.image = self.getBackgroundImage()
      }
      
    }
  }
  
  private func getWeatherInfo(lat: String, lon: String) {
    
    WeatherApiContol.shared.getWeatherHourlyInfo(lat: lat, lon: lon) { [weak self] (sky, temp, grid) in
      guard let `self` = self else { return print("self problem getWeatherInfo")}
      
      guard let temperature = self.numformat.string(from: (Double(temp["tc"] ?? "") ?? 0) as NSNumber),
        let temperatureMax = self.numformat.string(from: (Double(temp["tmax"] ?? "") ?? 0) as NSNumber),
        let temperatureMin = self.numformat.string(from: (Double(temp["tmin"] ?? "") ?? 0) as NSNumber),
        let city = grid["city"],
        let county = grid["county"],
        let village = grid["village"],
        let skyImage = sky["code"],
        let skyName = sky["name"] else { return print(" ok !")}
      
      DispatchQueue.main.async {
        self.weatherHeaderView.setWeatherInfo(temperature: temperature, temperatureMin: temperatureMin, temperatureMax: temperatureMax, skyName: skyName, image: skyImage)
        
        self.topView.setLocation(address: city + " " + county + " " + village)
      }
    }
    
    WeatherApiContol.shared.getWeather3daysInfo(lat: lat, lon: lon) { [weak self](sky, temp, time) in
      
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
      
      let now: Date = dateFormatter.date(from: time)!
      
      self?.fcstThreeHour.removeAll()
      
      for index in 0..<(temp.count <= sky.count ? temp.count : sky.count) {
        guard let temp = self?.numformat.string(from: (Double(temp["temp\(index * 3 + 4)hour"] ?? "") ?? 0) as NSNumber),
          let weatherImage = sky["code\(index * 3 + 4)hour"],
          let weatherString = sky["name\(index * 3 + 4)hour"],
          !(temp.isEmpty || weatherString.isEmpty || weatherImage.isEmpty)
          else { continue }
        
        var day = ""
        var time = ""
        
        let after = now + TimeInterval(3600 * (index * 3 + 4))
//        print("now: \(after), index: \(index), calc: \((index * 3 + 4))")
        self?.getTimeAfter(now: after, dateFormatter: dateFormatter, dayString: &day, timeString: &time)
        self?.fcstThreeHour.append((temp + "˚", weatherImage, weatherString, day, time))
      }
      
      DispatchQueue.main.async {
        self?.tableView.reloadData()
      }
    }
  }
  
  private func getWeatherInfoAnimating() {
    getWeatherInfo(lat: latitude, lon: longitude)
    topView.setRotationAnimation()
    
    (tableView.tableHeaderView as! WeatherHeaderView).temperatureAnimation()
    
    UIView.animate(withDuration: 1) {
      self.backgroundImageView.alpha = 0
      self.backgroundImageViewAnimate.alpha = 1
    }
    
    changeBackgroundImage()
  }
}

extension WeatherVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fcstThreeHour.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherInfoTableViewCell
    
    var skyImage = fcstThreeHour[indexPath.row].1
    skyImage.remove(at: skyImage.index(skyImage.startIndex, offsetBy: 4))
    cell.skyImage.image = UIImage(named: skyImage)
    cell.temperature.text = fcstThreeHour[indexPath.row].0
    cell.timeLabel.text = "\(indexPath.row)"
    cell.dayLabel.text = fcstThreeHour[indexPath.row].3
    cell.timeLabel.text = fcstThreeHour[indexPath.row].4
    return cell
  }
}

extension WeatherVC: UITableViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard fcstThreeHour.count > 0 else { return }
    
    let maxBalck = cellHeight * CGFloat(fcstThreeHour.count)
    blurEffectView.alpha  = scrollView.contentOffset.y / maxBalck
    
    if  0...60 ~= scrollView.contentOffset.y / 10 {
      backgoundLeftConstraint.constant = scrollView.contentOffset.y / 10
      backgoundRightConstraint.constant = scrollView.contentOffset.y / 10
    }
  }
}

extension WeatherVC: ReloadButtonClicked {
  func reload(_ sender: UIButton) {
    getWeatherInfoAnimating()
  }
}

extension WeatherVC: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let current = locations.last else { return print("locations.last not found")}
    
    if (abs(current.timestamp.timeIntervalSinceNow) < 0.05) {
      // span 단위는 1도
      // 경도 1도는 약 111 km
      // 위도 1도는 위도에 따라 변함 : 적도 (111km) ~ 극지방 (0 km)
      let coordnate = current.coordinate
//      print("called CLLocationManagerDelegate lat: \(coordnate.latitude), lon: \(coordnate.longitude)")
      
      latitude = "\(coordnate.latitude)"
      longitude = "\(abs(coordnate.longitude))"
      getWeatherInfoAnimating()
    }
  }
}
