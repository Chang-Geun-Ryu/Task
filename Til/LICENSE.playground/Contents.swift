import UIKit

var str = "Hello, playground"
/*
// 모나드 23.03.2019
 특정한 상태로 값을 포장하는 것, Optional과 같이 값이 있을수도 있고 없을 수도 있는 상태와 같이 값을 포장 하는 것
 모나드는 특정 기능이 아닌 디자인 패턴 혹은 자료구조
*/

func addThree(_ num: Int) -> Int {
    return num + 3
}

//addThree(2)                 // 5
//addThree(Optional(2))       // Error
//Optional(2).map(addThree)   // Optional(5)

func doubleEvne(_ num: Int) -> Int? {
    if num % 2 == 0 {
        return num * 2
    }
    return nil
}
Optional(3).flatMap(doubleEvne)

Optional.none.flatMap(doubleEvne)

let optionalArr: [Int?] = [1,2,nil,5]
let mappedArr: [Int?] = optionalArr.map{ $0 }
let flatmappedArr: [Int] = optionalArr.flatMap{ $0 }

print(mappedArr)        // [Optional(1), Optional(2), nil, Optional(5)]
print(flatmappedArr)    // [1, 2, 5]

let multipleContainer = [[1,2, Optional.none], [3, Optional.none], [4,5,Optional.none]]
let mappedMutipleContainer = multipleContainer.map{ $0.map{ $0} }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0} }

print(mappedMutipleContainer)       //[[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print(flatmappedMultipleContainer)  //[1, 2, 3, 4, 5]

func stringToInt(str: String) -> Int? {
    return Int(str)
}

func intToString(integer: Int) -> String? {
    return "\(integer)"
}

//var optionalString: String? = "2"
//var result: Any = optionalString.flatMap(stringToInt).flatMap(intToString).flatMap(stringToInt)
//
//print(result)   // Optional(2)
//result = optionalString.map(stringToInt)
//print(result)   //Optional(Optional(2))

func intToNil(param: Int) -> String? {
    return nil
}
var optionalString: String? = "2"
var result: Any = optionalString.flatMap(stringToInt).flatMap(intToNil).flatMap(stringToInt)
print(result)

