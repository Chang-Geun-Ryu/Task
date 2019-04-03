//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Person {
    var name: String
    required init() { // 요구 이니셜라이저 정의
        self.name = "Unknown"
    }
}
class Student: Person {
    var major: String = "Unknown"
    init(major: String) { // 자신의 지정 이니셜라이저 구현
        self.major = major
        super.init()
    }
    required override init() { // 부모클래스의 이니셜라이저를 재정의하고 요구이니셜라이저로 변경
        self.major = "Unknown"
        super.init()
    }
    required convenience init(name: String) {// 앞으로 계속 재정의 요구
        self.init()
        self.name = name
    }
}
class UniversityStudent: Student {
    var grade: String
    init(grade: String) {// 자신의 지정 이니셜라이저 구현
        self.grade = grade
        super.init()
    }
    required init() { // Student 클래스에서 요구하여 구현
        self.grade = "F"
        super.init()
    }
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}
let rcg: UniversityStudent = UniversityStudent()
print(rcg.grade) // F
let juHyun: UniversityStudent = UniversityStudent(name: "juhyun")
print(juHyun.name)  // juHyun
