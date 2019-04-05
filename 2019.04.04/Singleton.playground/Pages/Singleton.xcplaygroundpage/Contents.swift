//: [Previous](@previous)
import Foundation
import UIKit
/*:
 # Singleton
 - 특정 클래스의 인스턴스에 접근할 때 항상 동일한 인스턴스만을 반환하도록 하는 설계 패턴
 - 한 번 생성된 이후에는 프로그램이 종료될 때까지 항상 메모리에 상주
 - 어플리케이션에서 유일하게 하나만 필요한 객체에 사용
 - UIApplication, AppDelegate 등
 */

/***************************************************
 iOS 싱글톤 사용 예
 ***************************************************/
let screen = UIScreen.main
let userDefaults = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default


/*:
 ## Syntax
 */
//: ### Obj-C
//: ![objc_singleton](objc_singleton.png)
/*:
 ### Swift
 */

class NormalClass {
  var x = 0
}

let someObject1 = NormalClass()
someObject1.x = 5

let someObject2 = NormalClass()
someObject2.x = 1

let someObject3 = NormalClass()
someObject3.x = 10

someObject1.x
someObject2.x
someObject3.x



/***************************************************
 let으로 선언한 것은 기본적으로 thread-safe 하므로 Objective-C 처럼 별도로 dispatch_once_t 불필요
 static 전역 변수로 선언한 것은 lazy 하게 동작하므로 처음 Singleton을 생성하기 전까지 메모리에 올라가지 않음
 ***************************************************/

class SingletonClass {
  static let shared = SingletonClass()
  var x = 0
}


let singleton1 = SingletonClass.shared
singleton1.x = 10

let singleton2 = SingletonClass.shared
singleton2.x = 20

singleton1.x   //
singleton2.x   //

SingletonClass.shared.x = 30

SingletonClass.shared.x  //
singleton1.x  //
singleton2.x  //



SingletonClass().x = 99
SingletonClass().x   //
singleton1.x  //
singleton2.x  //



/***************************************************
 Q.
 하나의 객체만을 공용으로 사용하기 위해 싱글톤 클래스를 만들었는데
 현재 상태에서 생길 수 있는 문제점은?
 (항상 하나의 객체만을 사용하는 것을 강제해야 하는 상황)
 ***************************************************/

class Singleton {
  static let shared = Singleton()
  var x = 0
}

let object1 = Singleton.shared






// 여전히 새로운 객체를 만들고 다른 객체에 접근 가능

let object2 = Singleton()
object1.x = 10
object2.x = 20

object1.x
object2.x




/***************************************************
 외부에서 인스턴스를 직접 생성하지 못하도록 강제해야 할 경우 생성자를 private 으로 선언
 단, 일부러 새로운 것을 만들어서 쓸 수 있는 여지를 주고 싶은 경우는 무관
 ***************************************************/

class PrivateSingleton {
  static let shared = PrivateSingleton()
  private init() {}
  var x = 1
}

//let uniqueSingleton = PrivateSingleton.init()
let uniqueSingleton1 = PrivateSingleton.shared
let uniqueSingleton2 = PrivateSingleton.shared
uniqueSingleton1.x
uniqueSingleton2.x

uniqueSingleton1.x = 20

uniqueSingleton1.x
uniqueSingleton2.x


//: [Next](@next)
