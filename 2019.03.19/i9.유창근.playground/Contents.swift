import UIKit

var str = "Hello, playground"

//[ 과제 ]
//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//구현 내용은 자유롭게
//
//    ** 강아지 (Dog)
//    - 속성: 이름, 나이, 몸무게, 견종
//- 행위: 짖기, 먹기
//
//** 학생 (Student)
//- 속성: 이름, 나이, 학교명, 학년
//- 행위: 공부하기, 먹기, 잠자기
//
//** 아이폰(IPhone)
//- 속성: 기기명, 가격, faceID 기능 여부(Bool)
//- 행위: 전화 걸기, 문자 전송
//
//** 커피(Coffee)
//- 속성: 이름, 가격, 원두 원산지
//
//
class Dog {
    var name: String
    var age: Int
    var weight: Double
    var breed: String
    init(name: String, age: Int, weight: Double, breed: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.breed = breed
    }
    func barking() {
        print("왈왈")
    }
    
    func eating() {
        print("쩝쩝")
    }
}

class Student {
    var name: String
    var age: Int
    var schoolName: String
    var schoolYear: Int
    
    init(name: String, age: Int, schoolName: String, schoolYear: Int) {
        self.name = name
        self.age = age
        self.schoolName = schoolName
        self.schoolYear = schoolYear
    }
    
    func study() {
        print("열심")
    }
    func eating() {
        print("꾸역꾸역")
    }
    func sleeping() {
        print("쿨쿨")
    }
}

class IPhone {
    var name: String
    var price: Int
    var faceID: Bool
    
    init(name: String, price: Int, faceID: Bool) {
        self.name = name
        self.price = price
        self.faceID = faceID
    }
    
    func calling() {
        print("띨리링")
    }
    func texting() {
        print("틱틱")
    }
}

class Coffee{
    var name: String
    var price: Int
    var location: String
    
    init(name: String, price: Int, location: String) {
        self.name = name
        self.price = price
        self.location = location
    }
}
//
//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
//** 계산기 (Calculator)
//- 속성: 현재 값
//- 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
//
//ex)
//let calculator = Calculator() // 객체생성
//
//calculator.value  // 0
//
//calculator.add(10)    // 10
//calculator.add(5)     // 15
//
//calculator.subtract(9)  // 6
//calculator.subtract(10) // -4
//
//calculator.multiply(4)   // -16
//calculator.multiply(-10) // 160
//
//calculator.divide(10)   // 16
//calculator.reset()      // 0

class Calculator {
    var value: Int
    init(value: Int) {
        self.value = value
    }
    func add(_ param: Int) -> Int{
        return param + value
    }
    func subtract(_ param: Int) -> Int {
        return value - param
    }
    func multuply(_ param: Int) -> Int {
        return param * value
    }
    func divide(_ param: Int) -> Int {
        return value / param
    }
    func reset() {
        self.value = 0
    }
}

let calc = Calculator(value: 100)

calc.add(5)
calc.subtract(10)
calc.multuply(5)
calc.divide(2)
calc.reset()
