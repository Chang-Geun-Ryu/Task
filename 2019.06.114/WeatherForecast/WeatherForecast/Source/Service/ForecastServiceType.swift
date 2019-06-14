//
//  ForecastServiceType.swift
//  WeatherForecast
//
//  Created by giftbot on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

protocol ForecastServiceType {
  func fetchCurrentForecast(
    latitude: Double,
    longitude: Double,
    completionHandler: @escaping (Result<CurrentForecast, ServiceError>) -> Void
  )
  
  func fetchShortRangeForecast(
    latitude: Double,
    longitude: Double,
    completionHandler: @escaping (Result<[ShortRangeForecast], ServiceError>) -> Void
  )
}
