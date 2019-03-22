import UIKit

/*
- 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수
- 정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
- 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
- 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수
- 점수(문자 또는 숫자)를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
- 점수(문자 또는 숫자)를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
*/

// 난이도 쉬움!

func showNameAge(name: String, age: Int){
    print("I'm ", name, " and ", age);
}

showNameAge(name: "rcg", age: 99)

func mulNumb(first: Int, second: Int = 10) -> Int{
    return first * second
}

mulNumb(first: 20, second: 30)
mulNumb(first: 40)

func avgTest(first: Double, second: Double, third: Double, fourth: Double) -> Double{
    return (first + second + third + fourth) / 4
}

let avg = avgTest(first: 1.1, second: 2.2, third: 3.3, fourth: 4.4)

func gradeTest1(number: Double) ->String{
    var grade: String
    
    if(number >= 90){
        grade = "A"
    }
    else if(number >= 80){
        grade = "B"
    }
    else if(number >= 70){
        grade = "C"
    }
    else{
        grade = "F"
    }
    
    return grade
}

gradeTest1(number: 80)

func gradeTest2(_ numbers: Double...) ->String{
    var total: Double = 0.0
    for num in numbers {
        total += num
    }
    total /= Double(numbers.count)
    
    var grade: String
    if(total >= 90){
        grade = "A"
    }
    else if(total >= 80){
        grade = "B"
    }
    else if(total >= 70){
        grade = "C"
    }
    else{
        grade = "F"
    }
    
    return grade
}

gradeTest2(80, 90, 80, 60)
