//
//  AppDelegate.swift
//  StoryBoardPractice
//
//  Created by CHANGGUEN YU on 02/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

//[ 과제 ]
//1.
//func addTwoValues(a: Int, b: Int) -> Int {
//    return a + b
//}
//let task1: Any = addTwoValues(a: 2, b: 3)
//위와 같이 task1 이라는 변수가 있을 때
//task1 + task1 의 결과가 제대로 출력되도록 할 것
//
//2. 스토리보드 이용할 것
//- FirstVC 에 개, 고양이, 새 라는 이름의 UIButton 3개 생성
//- SecondVC 에 UIImageView 하나와 Dismiss 를 위한 버튼 하나 생성
//- FirstVC에 있는 버튼 3개 중 하나를 누르면 그 타이틀에 맞는 이미지를 SecondVC의 ImageView 에 넣기
//(이미지는 구글링 등을 통해 활용)
//- 각 버튼별로 전환 횟수를 세서 개는 8회, 고양이는 10회, 새는 15회가 넘어서면 화면이 전환되지 않도록 막기
//- 그리고 SecondVC 에 추가로 UIButton 을 하나 더 생성하여 그 버튼을 누를 때마다 전환 횟수를 계산하는 값이 개와 고양이, 새 모두에 대해 1회씩 추가되도록 구현
//
//
//3. 클래스 매니저 과제
//- 첫번째 뷰에 레이블과 버튼을 생성하고 버튼을 통해 두번쨰 뷰로 이동.
//- 두번째 뷰에는 segmentedController 를 생성하고 선택한값을 첫번째 뷰의 레이블에 띄우세요.
//
//[ 도전 과제 ]
//1.
//let task2: Any = addTwoValues
//위와 같이 task2 라는 변수가 있을 때
//task2 + task2 의 결과가 제대로 출력되도록 할 것 (addTwoValues의 각 파라미터에는 2와 3 입력)
//
//2.
//class Car {}
//let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
//
//위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기

func work1() {
    //1.
    func addTwoValues(a: Int, b: Int) -> Int {
        return a + b
    }
    //[ 도전 과제 ]
    //1.
    //let task2: Any = addTwoValues
    //위와 같이 task2 라는 변수가 있을 때
    //task2 + task2 의 결과가 제대로 출력되도록 할 것 (addTwoValues의 각 파라미터에는 2와 3 입력)
    let task2: Any = addTwoValues
    
    let task22 = (task2 as! (Int, Int) -> Int)(2, 3) + (task2 as! (Int, Int) -> Int)(2, 3)
    print(task22)
    
    guard let task3 = task2 as? (Int, Int) -> Int else { return }
    let task4 = task3(2, 3) + task3(2, 3)
    print(task4)
    //2.
    class Car {}
    let values: [Any] = [0, 0.0, (2.0, Double.pi), Car(), { (str: String) -> Int in str.count }]
    
    for value in values {
        switch value {
        case let val as Int:
            print(val)
        case let val as Double:
            print(val)
        case let tuple as (Double, Double):
            print(tuple.0, tuple.1)
        case let obj as Car:
            print(obj)
        case let obj as (String) -> Int:
            print(obj)
        default:
            break
        }
    }
    //
    //위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
}

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        work1()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

