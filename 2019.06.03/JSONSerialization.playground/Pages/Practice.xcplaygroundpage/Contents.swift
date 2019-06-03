//: [Previous](@previous)
import Foundation


/***************************************************
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 "http://api.open-notify.org/iss-now.json"
 ***************************************************/


func practice1() {
  let issLocationUrl = "http://api.open-notify.org/iss-now.json"
  let apiURL = URL(string: issLocationUrl)!

  let getLocationTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
    guard error == nil else { return }
    guard let response = response as? HTTPURLResponse,
      200..<400 ~= response.statusCode else { return print("HTTPURLResponse fail")}
    guard let data = data,
      let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
      else { return print("no Data")}
    
    guard (jsonObject["message"] as? String) == "success",
      let location = jsonObject["iss_position"] as? [String: String],
      let latitude = location["longitude"] as? String,
      let longitude = location["latitude"] as? String,
      let timestamp = jsonObject["timestamp"] as? Int
    else { return print("message return fail...")}
    
    print("\n---------- [ Parsing Success ] ----------\n")
    print("latitude : \(latitude), longitude: \(longitude)")
    print("timestamp : \(timestamp)")
  }
  
  getLocationTask.resume()
}
practice1()


/***************************************************
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 ***************************************************/

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
"""

struct User {
  let id: Int
  let firstName: String
  let lastName: String
  let email: String
}

func practice2() {
  let jsonData1 = jsonString2.data(using: .utf8)!
  var userArray: [User] = []
  do {
    let dataObj = try JSONSerialization.jsonObject(with: jsonData1, options: [])
    if let jsonDict = dataObj as? [String: Any] {

      guard let dictArray = jsonDict["users"] as? [[String: Any]] else { return print("error")}
      
      dictArray.forEach{
        userArray.append(User(id: $0["id"] as! Int, firstName: $0["first_name"] as! String, lastName: $0["last_name"] as! String, email: $0["email"] as! String))
      }
    }
  } catch {
    print(error.localizedDescription)
  }
  
  for user in userArray{
    print("User(id: \(user.id), firstName: \(user.firstName), lastName: \(user.lastName), email: \(user.email)")
  }
  
}
practice2()



/***************************************************
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 "https://jsonplaceholder.typicode.com/posts"
 ***************************************************/

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
  let postAddress = "https://jsonplaceholder.typicode.com/posts"
  let postURL = URL(string: postAddress)!
  
  var post: [Post] = []
  
  URLSession.shared.dataTask(with: postURL) { (data, response, error) in
    guard error == nil else { return print("failddddd")}
    guard let response = response as? HTTPURLResponse,
      200..<400 ~= response.statusCode else { return print("HTTPURLResponse fail")}
    
    guard let data = data,
      let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
      else { return print("no Data")}
    
    for dict in jsonObject {
      guard let userId = dict["userId"] as? Int,
            let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let body = dict["body"] as? String
        else { return print("Aaaaa")}
      
      let data = Post(userId: userId, id: id, title: title, body: body)
      post.append(data)
    }
    
    print(post.count)
    
  }.resume()
  
  
}

practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)

