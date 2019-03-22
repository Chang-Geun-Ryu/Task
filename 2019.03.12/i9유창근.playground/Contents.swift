import UIKit

var str = "Hello, playground"
/*
[ 과제 ]
- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
(1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)
- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수
- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수
- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
(입력된 숫자가 4면 0, 1, 1, 2, 3, 5 ... 에서 4번째 위치인 2 출력.    )
- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수
*/
// 제출 : 수요일 밤까지 과제 제출용 폴더에 Playground 파일 업로드
// 정답 풀이는 목요일 전달
// 항목별 체감 난이도도 주석으로 같이 적어주세요.

func twoSum(first: Int, second: Int) -> Int {
    let firstText: String = String(first)
    let secondeText: String = String(second)
    
    let sumText: Int = Int(firstText + secondeText)!
    
    return sumText
}

twoSum(first: 10, second: 20)

func twodiff(first: String, second: String) -> Bool {
    var check: Bool = false
    
    if first == second{
        check = true
        print("=")
    }
    else{
        check = false
        print("!")
    }
    
    return check
}

let check: Bool = twodiff(first: "aa", second: "bb")

func naturalNumber(number: Int) {
    
    for num in 1...number{
        if number % num == 0 {
            print(num)
        }
        else{
        
        }
    }
}

naturalNumber(number: 100)

func primeNumber(number: Int) -> Bool{
    var primeCheck: Bool = true
    
    for num in 2...(number-1) {
        if number % num == 0{
            primeCheck = false
        }
    }
    
    print(primeCheck)
    return primeCheck
}

primeNumber(number: 6)

func fibonacciNumber(number: Int) -> Int{
    var num = 3
    var before2 = 0
    var before1 = 1
    var fibo = 0
    if number == 1{
        return 0
    }
    else if number == 2 {
        return 1
    }
    while number >= num {
        fibo = before2 + before1
        print(fibo)
        before2 = before1
        before1 = fibo
        num += 1
    }
    
    return fibo
}

fibonacciNumber(number: 6)


func commonMultiple(){
    var numbers: Array<Int> = []
    
    for num5 in 1...10 {
        for num3 in 1...10{
            let number: Int = Int(pow(Double(3), Double(num3))) * Int(pow(Double(5), Double(num5)))
            
            if number < 1000{
                numbers.append(number)
            }
            else {
            break
            }
        }
    }
    numbers.sort()
    print(numbers)
}

commonMultiple()

