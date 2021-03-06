//
//  AppDelegate.swift
//  MusicListPractice
//
//  Created by CHANGGUEN YU on 07/06/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let navi = UINavigationController(rootViewController: SearchVC())
    
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    window?.rootViewController = navi
    
    return true
  }
}

