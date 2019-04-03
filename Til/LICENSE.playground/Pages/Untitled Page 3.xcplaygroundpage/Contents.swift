//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "who?")
    }
}

class Student: Person {
    var major: String
    convenience init(major: String) {
        self.init()
        self.major = "Unknown"
    }
    override convenience init(name: String) {
        self.init(name: name, major: "Unknown")
    }
    init(name: String, major: String) {
            self.major = major
            super.init(name: name)
    }
}
class UniversityStudent: Student {
    var grade: String = "A+"
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    convenience init(name: String, major: String, grade: String) {
        self.init(name: name, major: major)
        self.grade = grade
    }
}
let nova: UniversityStudent = UniversityStudent()
print(nova.description)
let raon: UniversityStudent = UniversityStudent(name: "raon")
print(raon.description)
let joker: UniversityStudent = UniversityStudent(name: "joker", major: "com")
print(joker.description)
let chop: UniversityStudent = UniversityStudent(name: "chope", major: "computer", grade: "C")
print(chop.description)

