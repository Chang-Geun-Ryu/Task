//
//  AppDelegate.swift
//  NotificationCenterPractics
//
//  Created by CHANGGUEN YU on 30/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    
    let vc = ViewController()
    let secondVC = SecondViewController()
    
    vc.tabBarItem = UITabBarItem(title: "Item", image: nil, tag: 0)
    secondVC.tabBarItem = UITabBarItem(title: "Item", image: nil, tag: 1)
    secondVC.setNotificationCentor()
    
    let tabBarVC = UITabBarController()
    tabBarVC.setViewControllers([vc,secondVC], animated: true)
    
    window?.rootViewController = tabBarVC
    window?.makeKeyAndVisible()
    
    return true
  }

}

