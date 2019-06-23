/*:
 ---
 ## 3번 문제 (최종 결과)
 ---
 */
import Foundation


func insertionSort(sort: [[Int]]) -> [[Int]] {
  var sortedArray: [[Int]] = []
  
  for array in sort {
    guard array.count > 1 else { sortedArray.append(array); continue}
    var sortArray = array
    
    for num in 1..<array.count {
      for index in (0..<num).reversed() {
        if sortArray[index] > sortArray[index + 1] {
          let temp = sortArray[index]
          sortArray[index] = sortArray[index + 1]
          sortArray[index + 1] = temp
        }
      }
    }
    sortedArray.append(sortArray)
  }
  
  return sortedArray
}

var inputCases = [
  [],
  [1],
  [1,1,2,2,3,3,1,2,3],
  [14,10,9,7,6,5,3,2,1],
  [5,6,1,3,10,2,7,14,9],
]
let cases = insertionSort(sort: inputCases)

print(cases)
