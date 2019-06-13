//
//  WeatherApiContol.swift
//  WeatherForecast
//
//  Created by CHANGGUEN YU on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

final class WeatherApiContol {
  
  static let shared = WeatherApiContol()
  
  func getWeather3daysInfo(lat: String, lon: String, completionHandler: @escaping ([String: String], [String: String], String) -> ()) {
    let urlString = "https://api2.sktelecom.com/weather/forecast/3days?appKey=e4fcc3d2-a5f3-4615-9bed-04ac394442e0&lat=\(lat)&lon=\(lon)"
    
    guard let url = URL(string: urlString) else { return print("couldn't create URL")}
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription)}
      guard let respons = response as? HTTPURLResponse,
        (200..<300).contains(respons.statusCode) else {return print("http status fail")}
      
      guard let data = data,
        let source = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        let weather = source["weather"] as? [String: Any],
        let forecast3days = weather["forecast3days"] as? [[String: Any]],
        let fcst3hour = forecast3days[0]["fcst3hour"] as? [String: Any],
        let sky = fcst3hour["sky"] as? [String: String],
        let temperature = fcst3hour["temperature"] as? [String: String],
        let timeRelease = forecast3days[0]["timeRelease"] as? String else { return print("data problem")}
      
      completionHandler(sky, temperature, timeRelease)
      }.resume()
  }
  
  func getWeatherHourlyInfo(lat: String, lon: String, completionHandler: @escaping ([String: String], [String: String], [String: String]) -> ()) {
    
    let urlString = "https://api2.sktelecom.com/weather/current/hourly?appKey=e4fcc3d2-a5f3-4615-9bed-04ac394442e0&lat=\(lat)&lon=\(lon)"
    
    guard let url = URL(string: urlString) else { return print("couldn't create URL")}
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription)}
      guard let response = response as? HTTPURLResponse,
        (200..<300).contains(response.statusCode) else {return print("http status fail")}
      
      guard let data = data,
        let source = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        let weather = source["weather"] as? [String: Any],
        let hourly = weather["hourly"] as? [[String: Any]],
        let grid = hourly[0]["grid"] as? [String: String],
        let sky = hourly[0]["sky"] as? [String: String],
        let temperature = hourly[0]["temperature"] as? [String: String] else { return print("data problem")}
      
      completionHandler(sky, temperature, grid)
    }.resume()
  }
}

