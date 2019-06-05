//: [Previous](@previous)
//: # Versus Serialization
import Foundation

struct Dog: Codable {
  let name: String
  let age: Int
}

/*:
 ---
 ### Question
 - JSONSerialization을 이용해 Dog객체 생성
 - JSONDecoder를 이용해 Dog객체 생성
 ---
 */

/***************************************************
 Basic
 ***************************************************/
print("\n---------- [ Basic ] ----------\n")
let jsonData = """
  {
    "name": "Tory",
    "age": 3,
  }
  """.data(using: .utf8)!

// JSONSerialization
do {
  let dataObj = try JSONSerialization.jsonObject(with: jsonData, options: [])
  if let dict = dataObj as? [String: Any] {
    print(Dog(name: dict["name"] as! String, age: dict["age"] as! Int))
  }else {
    print("fail")
    
  }
  
  
} catch {
  print(error.localizedDescription)
}

// JSONDecoder

let jsonDecoder = JSONDecoder()
if let decoded = try? jsonDecoder.decode(Dog.self, from: jsonData) {
  print(decoded)
}



/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------\n")
let jsonArrData = """
  [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
  """.data(using: .utf8)!


// JSONSerialization

do {
  let dataObj = try JSONSerialization.jsonObject(with: jsonArrData, options: [])
  if let array = dataObj as? [[String: Any]] {
    for dict in array {
      print(Dog(name: dict["name"] as! String, age: dict["age"] as! Int))
    }
  }else {
    print("fail")
    
  }
} catch {
  print(error.localizedDescription)
}

// JSONDecoder


if let decodedArray = try? jsonDecoder.decode([Dog].self, from: jsonData) {
  print(decodedArray)
}



/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------\n")
let jsonDictData = """
{
  "data": [
    { "name": "Tory", "age": 3 },
    { "name": "Tory", "age": 3 },
  ]
}
""".data(using: .utf8)!

// JSONSerialization

do {
  let dataObj = try JSONSerialization.jsonObject(with: jsonDictData, options: [])
  if let dictionary = dataObj as? [String: [[String: Any]]] {// &&
    
      let dog = dictionary["data"].map {
        $0.compactMap{ Dog(name: $0["name"] as! String, age: $0["age"] as! Int) }
      }!
      print(dog)
  }else {
    print("fail")
  }
} catch {
  print(error.localizedDescription)
}


// JSONDecoder


if let decodedArray = try? jsonDecoder.decode([String: [Dog]].self, from: jsonData) {
  print(decodedArray)
}





/*:
 ---
 ### Answer
 ---
 */
print("\n---------- [ Answer ] ----------\n")

extension Dog {
  init?(from json: [String: Any]) {
    guard let name = json["name"] as? String,
      let age = json["age"] as? Int
      else { return nil }
    self.name = name
    self.age = age
  }
}

/***************************************************
 Basic
 ***************************************************/
print("---------- [ Basic ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] {
  if let dog = Dog(from: jsonObject) {
    print("Serialization :", dog)
  }
}

// JSONDecoder
if let dog = try? JSONDecoder().decode(Dog.self, from: jsonData) {
  print("Decoder :", dog)
}

/***************************************************
 Array
 ***************************************************/
print("\n---------- [ Array ] ----------")
// JSONSerialization
if let jsonObjects = try? JSONSerialization.jsonObject(with: jsonArrData) as? [[String: Any]] {
  
  jsonObjects
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([Dog].self, from: jsonArrData) {
  dogs.forEach { print("Decoder :", $0) }
}


/***************************************************
 Dictionary
 ***************************************************/
print("\n---------- [ Dictionary ] ----------")
// JSONSerialization
if let jsonObject = try? JSONSerialization.jsonObject(with: jsonDictData) as? [String: Any],
  let data = jsonObject["data"] as? [[String: Any]] {
  
  data
    .compactMap { Dog(from: $0) }
    .forEach { print("Serialization :", $0) }
}

// JSONDecoder
if let dogs = try? JSONDecoder().decode([String: [Dog]].self, from: jsonDictData) {
  dogs.values.forEach { $0.forEach { print("Decoder :", $0) } }
}



//: [Table of Contents](@Contents) | [Previous](@previous) | [Next](@next)
