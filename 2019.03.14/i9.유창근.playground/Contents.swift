import UIKit

var str = "Hello, playground"

// 난이도 쉬움: 1 -> 어려움: 10
// 난이도 : 3

//[ 과제 ]
//    - 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
//ex) 123 -> 321 , 10293 -> 39201
func reversFunc(in number: Int) -> Int {
    let ss = String(String(number).reversed())

    return Int(ss)!
}

reversFunc(in: 1012346)
//
//- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
//ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
let array = ["a", "b", "c", "a", "e", "d", "c"]

func nonOverlap(in array: [String]) -> [String]{
    var nonOverlapArr: [String] = []
    var set: Set<String> = []
    
    for str in array {
        set.insert(str)
    }
    
    for str in set {
        nonOverlapArr.append(str)
    }
    return nonOverlapArr
}

nonOverlap(in: array)
    
//
//- 임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
//ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
let arrayIntegers = [2, 8, 7, 1, 4, 3]

func sortOddEven(in array: [Int]) -> [Int]{
    var OddEvenArray: [Int] = []
    
    for num in array {
        if num % 2 != 0 {
            OddEvenArray.insert(num, at: 0)
        } else{
            OddEvenArray.append(num)
        }
    }
    return OddEvenArray
}

sortOddEven(in: arrayIntegers)
    
//
//- 2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
    case addition, subtraction, multiplication, division
}
func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    // 코드
    switch op {
    case .addition:
        return operand1 + operand2
    case .subtraction:
        return operand1 - operand2
    case .multiplication:
        return operand1 * operand2
    case .division:
        return operand1 / operand2
    }
}

calculator(operand1: 5, operand2: 2, op: .addition)
calculator(operand1: 5, operand2: 2, op: .subtraction)
calculator(operand1: 5, operand2: 2, op: .multiplication)
calculator(operand1: 5, operand2: 2, op: .division)
//
//- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
//    + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기

// 제출 : 일요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 월요일 전달

let animal = [
    "식육목":
        [
        "개과":
            [
            "개": ["자칼", "늑대", "북미산 이리"],
            "여우": ["아메리카 여우", "유럽 여우"]
            ],
        "고양이과":
            [
            "고양이": ["고양이", "살쾡이"],
            "표범": ["사자", "호랑이"]
            ]
        ]
]

if let dic  = animal["식육목"] {
   if let dic1 = dic["고양이과"] {
    if let dic2 = dic1["표범"] {
        print(dic2[1])
    }
    }
}

