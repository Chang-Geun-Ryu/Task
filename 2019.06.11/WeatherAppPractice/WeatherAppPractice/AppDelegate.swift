//
//  AppDelegate.swift
//  WeatherAppPractice
//
//  Created by CHANGGUEN YU on 11/06/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .black
    window?.makeKeyAndVisible()
    window?.rootViewController = WeatherVC()
    
    return true
  }
}

