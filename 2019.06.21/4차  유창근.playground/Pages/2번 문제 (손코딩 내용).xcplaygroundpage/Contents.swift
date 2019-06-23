/*:
 ---
 ## 2번 문제 (손 코딩 내용)
 ---
 */
import Foundation

func fizzBuzzIf(N: Int) -> String {
  guard 1...100 ~= N else { return "Range Error" }
  var result = ""
  
  if N % 3 == 0 { result = "fizz" }
  
  if N % 5 == 0 { result += "Buzz"}
  
  if result.isEmpty {
    result = "\(N)"
  }
  
  return result
}

print("fizzBuzzIf \(fizzBuzzIf(N: 5) )")

func fizzBuzzSwitch(N: Int) -> String {
  guard 1...100 ~= N else { return "Range Error" }
  var result = ""
  
  switch N {
  case let value where value % 3 == 0:
    result = "fizz"
    fallthrough
  case let value where value % 5 == 0:
    result += "Buzz"
  default:
    result = "\(N)"
  }
  
  return result
}

print("fizzBuzzSwitch \(fizzBuzzSwitch(N: 5) )")

let fizzBuzzColsure = { (N: Int) -> String in
  guard 1...100 ~= N else { return "Range Error" }
  var result = ""
  
  if N % 3 == 0 { result = "fizz" }
  
  if N % 5 == 0 { result += "Buzz"}
  
  if result.isEmpty {
    result = "\(N)"
  }
  
  return result
}
print("fizzBuzzColsure \(fizzBuzzColsure(5))")

let numberArray = Array<Int>(1...100)

let fizzBuzzArray = numberArray.map { fizzBuzzIf(N: $0) }

print("fizzBuzzArray \(fizzBuzzArray)")
