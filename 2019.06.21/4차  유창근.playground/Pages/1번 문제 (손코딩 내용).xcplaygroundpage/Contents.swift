/*:
 ---
 ## 1번 문제 (손 코딩 내용)
 ---
 */
import Foundation

func goStones(N: Int) -> String {
  guard 1...10000 ~= N else { return "Range Error"}
  
  var count = 0
  var goStones = N
  
  while true {
    if goStones - 4 == 0 { return count % 2 == 0 ? "정아" : "창근"}
    else if goStones - 3 == 0 { return count % 2 == 0 ? "정아" : "창근"}
    else if goStones - 1 == 0 { return count % 2 == 0 ? "정아" : "창근"}
    else if goStones - 4 >= 2 { goStones -= 4; print("4")}
    else if goStones - 3 >= 2 { goStones -= 3; print("3")}
    else if goStones - 1 > 0 { goStones -= 1; print("1")}
    
    count += 1
  }
  
//  return ""
}

goStones(N: 37)
