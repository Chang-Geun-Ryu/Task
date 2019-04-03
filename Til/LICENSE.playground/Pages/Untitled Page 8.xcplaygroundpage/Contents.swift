//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//1.
func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}

let task1: Any = addTwoValues(a: 3, b: 3)
let task11 = (task1 as! Int) + (task1 as! Int)
let task12 = (task1 as? Int ?? 0) + (task1 as? Int ?? 0)
print(task11)
print(task12)



//[ 도전 과제 ]
//1.
//let task2: Any = addTwoValues
//위와 같이 task2 라는 변수가 있을 때
//task2 + task2 의 결과가 제대로 출력되도록 할 것 (addTwoValues의 각 파라미터에는 2와 3 입력)
let task2: Any = addTwoValues

let task22 = (task2 as! (Int, Int) -> Int)(2, 3) + (task2 as! (Int, Int) -> Int)(2, 3)
//let task23 = (task2 as? (Int, Int) -> Int ?? )(2, 3) + (task2 as? (Int, Int) -> Int ?? )(2, 3)
if let task3 = task2 as? (Int, Int) -> Int {
    let task4 = task3(2, 3) + task3(2, 3)
    print(task4)
}
else {  }


print(task22)

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
