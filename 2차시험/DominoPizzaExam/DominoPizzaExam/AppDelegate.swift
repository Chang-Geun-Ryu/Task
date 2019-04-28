//
//  AppDelegate.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    
    let cVC = CategoryViewController()
    let wVC = WishListViewController()
    cVC.tabBarItem = UITabBarItem(title: "Domino's", image: nil, tag: 0)
    wVC.tabBarItem = UITabBarItem(title: "Wish List", image: nil, tag: 1)
    // 메뉴 정보 인스턴스 wish list에 복사
    wVC.menu = cVC.menus
    
    let navi = UINavigationController(rootViewController: cVC)
    let navi2 = UINavigationController(rootViewController: wVC)
    let tabBarController = UITabBarController()
    tabBarController.setViewControllers([navi, navi2], animated: true)
    
    window?.rootViewController = tabBarController
    window?.makeKeyAndVisible()
    return true
  }
  
}
