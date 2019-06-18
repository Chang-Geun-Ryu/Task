//
//  ServiceError.swift
//  WeatherForecast
//
//  Created by giftbot on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

enum ServiceError: Error {
  case noData
  case clientError
  case invalidStatusCode
  case invalidFormat
}
