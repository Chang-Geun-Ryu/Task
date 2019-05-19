import UIKit


let dict = [["A": 10, "B": 20, "C": 40]]
let array = [dict]
print(array)

let value = array.flatMap { $0 } .map { $0["A"]}
print(value)

type(of: value[0])

let value11: (String, Int) = (value: "A", key: 1)

print(value11)
