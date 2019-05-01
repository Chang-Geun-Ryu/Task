//
//  AppDelegate.swift
//  TableviewSectionPractics
//
//  Created by CHANGGUEN YU on 01/05/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    
    let vc = ViewController()
    vc.tabBarItem = UITabBarItem(title: "Table", image: nil, tag: 0)
    let secondVC = SecondViewController()
    secondVC.tabBarItem = UITabBarItem(title: "Fake", image: nil, tag: 0)
    secondVC.data = vc.data
    
    let tabarVC = UITabBarController()
    tabarVC.setViewControllers([vc, secondVC], animated: true)
  
    window?.rootViewController = tabarVC
    window?.makeKeyAndVisible()
    
    return true
  }


}

