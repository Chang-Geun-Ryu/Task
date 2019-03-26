//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
class Person {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    var koreanAge: Int {
        return self.age + 1
    }
    var fullName: String {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
}

class Student: Person{
    var grade: String = "F"
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
    
    override var fullName: String {
        didSet {
            print("Full Name : \(self.fullName)")
        }
    }
}


let rcg: Person = Person()
rcg.name = "rcg"
rcg.age = 86    // Person age : 86
rcg.fullName = "Ryu Chang Geun"
print(rcg.koreanAge)    // 87

let jay: Student = Student()
jay.name = "jay"
jay.age = 14    // Person age : 14 Student age : 15
jay.koreanAge = 15
jay.fullName = "kim jay"    // Full Name : Kim jay
print(jay.koreanAge)    // 15

//class UniversityStudent: Student {
//    var major: String = ""
//    class func introduceClass() {
//        print(super.introduceClass())
//    }
//    override class func introduceClass() -> String {
//        return "대학생의 소원은 A+입니다."
//    }
//    override func speak() {
//        super.speak()
//        print("대학생이죠.")
//    }
//}
//
//let rcg: Person = Person()
//rcg.speak() //가나다라마바사
//
//let jay: Student = Student()
//jay.speak() //저는 학생입니다.
//
//let janny: UniversityStudent = UniversityStudent()
//janny.speak()   // 저는 학생입니다. 대학생이죠
//
//print(Person.introduceClass())  //인류의 소원은 평화입니다
//print(Student.introduceClass()) //인류의 소원은 평화입니다
//print(UniversityStudent.introduceClass() as String) // 대학생의 소원은 A+입니다.
//UniversityStudent.introduceClass() as Void  // 인류의 소원은 평화입니다.

class School {
    var student: [Student] = [Student]()
    subscript(number: Int) -> Student {
        print("School subscript")
        return student[number]
    }
}

class MiddleSchool: School {
    var middleStudent: [index: ]
}
