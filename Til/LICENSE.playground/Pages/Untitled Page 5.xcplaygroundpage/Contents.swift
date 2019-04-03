//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Coffee {
    let name: String
    let shot: Int
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}
class Latte: Coffee {
    var flavor: String
    override var description: String {
        return "\(shot) shot(s) \(flavor)"
    }
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}
class Americano: Coffee {
    let iced: Bool
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)
let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)
let yourCoffee: Latte = Latte(flavor: "Green tea", shot: 3)
//
print(coffee is Coffee)     // true
print(coffee is Americano)  // false
print(coffee is Latte)      // false
print(myCoffee is Coffee)   // true
print(yourCoffee is Coffee) // true
print(myCoffee is Latte)    // false
print(yourCoffee is Latte)  // true
print("---------------------------")

print(type(of: coffee) == Coffee.self)          // true
print(type(of: coffee) == Americano.self)       // false
print(type(of: coffee) == Latte.self)           // false

print(type(of: coffee) == Americano.self)       // false
print(type(of: myCoffee) == Americano.self)     // true
print(type(of: yourCoffee) == Americano.self)   // false

print(type(of: coffee) == Latte.self)           // false
print(type(of: myCoffee) == Latte.self)         // fasle
print(type(of: yourCoffee) == Latte.self)       // true

let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)
print(actingConstant.description)   // 2 shot(s) vanilla latte

// 1 shot(s) coffee
if let actingOne: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee
if let actingOne: Latte = coffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}
// This is Just Coffee
if let actingOne: Coffee = coffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
// This is Americano
if let actingOne: Americano = myCoffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee
if let actingOne: Latte = myCoffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}
// This is Just Coffee
if let actingOne: Coffee = myCoffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
let castedCoffee: Coffee = yourCoffee as! Coffee        // success
//let castedAmericano: Americano = coffee as! Americano   // fail




func checkType(of item: AnyObject) {
    if let castedItem: Latte = item as? Latte {
        print(castedItem.description)
    } else if let castedItem: Americano = item as? Americano {
        print(castedItem.description)
    } else if let castedItem: Coffee = item as? Coffee {
        print(castedItem.description)
    } else {
        print("Unknwon Type")
    }
}
checkType(of: coffee)           // 1 shot(s) coffee
checkType(of: myCoffee)         // 2 shot(s) hot americano
checkType(of: yourCoffee)       // 3 shot(s) Green tea
checkType(of: actingConstant)   // 2 shot(s) vanilla

func checkAnyType(of item: Any) {
    switch item {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let latte as Latte:
        print(latte.description)
    case let stringConverter as (String) -> String:
        print(stringConverter("RCG"))
    default:
        print("something else : \(type(of: item))")
    }
}
checkAnyType(of: 0)
checkAnyType(of: 0.0)
checkAnyType(of: 42)
checkAnyType(of: 3.14159)
checkAnyType(of: -0.25)
checkAnyType(of: "hello")
checkAnyType(of: (3.0, 5.5))
checkAnyType(of: yourCoffee)
checkAnyType(of: {(name: String) -> String in "Hello, \(name)"})


protocol SomeProtocol {
    var settableProperty: String {get set}
    var notNeedToBeSettableProperty: String { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
    static var anotherTypeProperty: Int { get }
}

protocol Sendable {
    var from: String { get }
    var to: String { get }
}
class Message: Sendable {
    var sender: String
    var from: String {
        return self.sender
    }
    var to: String
    init(sender: String, receiver: String) {
        self.sender = sender
        self.to receiver
    }
}


protocol Receiveable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    func send(data: Any)
    static func isEndableInstance(_ instance: Any) -> Bool
}
class Message: Sendable, Receiveable { // 수신, 발신 가능한 Message 클래스
    // 발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 함
    var from: Sendable {
        return self
    }
    // 상대방은 수신 가능한 객체, 즉 Receiveable 프로토콜을 준수하는 타입의 인스턴스여야 함
    var to: Receiveable?
    func send(data: Any) { // 메시지를 발신합니다
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        // 수신 가능한 인스턴스의 received 메서드를 호출
        receiver.received(data: data, from: self.from)
    }
    // 메시지를 수신
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }
    // class func 메서드이므로 상속이 가능
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}
class Mail: Sendable, Receiveable {
    var srom: Sendable{
        return self
    }
    var to: Receiveable?
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self. from)
    }
    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }
    // static 메서드이므로 상속이 불가능
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}
//let myPhoneMessage: Message = Message()
//let yourPhoneMessage: Message = Message()
//// 아직 수신받을 인스턴스가 없음
//myPhoneMessage.send(data: "Hello") // Message has receiver
//// Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받기 가능
//myPhoneMessage.to = yourPhoneMessage
//myPhoneMessage.send(data: "Hello") // Message received Hello from Nessage
//
//
//

////


