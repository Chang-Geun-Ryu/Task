//: [Previous](@previous)
import Foundation

let decoder = JSONDecoder()

/***************************************************
 1번 문제
 - 다음 JSON 내용을 Fruit 타입으로 변환
 ***************************************************/
print("\n---------- [ 1번 문제 (Fruits) ] ----------\n")
let jsonFruits = """
[
  {
    "name": "Orange",
    "cost": 100,
    "description": "A juicy orange"
  },
  {
    "name": "Apple",
    "cost": 200,
  },
  {
    "name": "Watermelon",
    "cost": 300,
  }
]
""".data(using: .utf8)!


struct Fruit: Decodable {
  var name: String
  var cost: Int
  var description: String?
}

if let fruit = try? decoder.decode([Fruit].self, from: jsonFruits) {
  print(fruit)
}


/***************************************************
 2번 문제
 - 다음 JSON 내용을 Report 타입으로 변환
 ***************************************************/
print("\n---------- [ 2번 문제 (Report) ] ----------\n")
let jsonReport = """
{
  "name": "Final Results for iOS",
  "report_id": "905",
  "read_count": "10",
  "report_date": "2019-02-14",
}
""".data(using: .utf8)!

struct Report: Decodable {
  var name: String
  var reportId: String
  var readCount: String
  var reportDate: String
  
  enum CodingKeys: String, CodingKey {
    case name
    case reportId = "report_id"
    case readCount = "read_count"
    case reportDate = "report_date"
  }
  
}

if let report = try? decoder.decode(Report.self, from: jsonReport) {
  print(report)
} else {
  print("fail")
}

/***************************************************
 3번 문제
 - Nested Codable 내용을 참고하여 다음 JSON 내용을 파싱
 ***************************************************/
print("\n---------- [ 3번 문제 (Movie) ] ----------\n")
let jsonMovie = """
[
  {
    "name": "Edward",
    "favorite_movies": [
      {
        "title": "Big Fish",
        "release_year": 2003
      },
      {
        "title": "Gran Torino",
        "release_year": 2008
      },
      {
        "title": "3 Idiots",
        "release_year": 2009
      },
    ]
  }
]
""".data(using: .utf8)!

struct Person {
  var name: String
  var favoriteMovies: [Movie]
  
  enum CodingKeys: String, CodingKey {
    case name
    case favoriteMovies = "favorite_movies"
  }
  
  struct Movie {
    var title: String
    var releaseYear: Int
    
    enum AddCodingKeys: String, CodingKey {
      case title
      case releaseYear = "release_year"
    }
  }
}

extension Person: Decodable {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decode(String.self, forKey: .name)
    favoriteMovies = try values.decode([Movie].self, forKey: .favoriteMovies)
  }
}

extension Person.Movie: Decodable {
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: AddCodingKeys.self)
    title = try values.decode(String.self, forKey: .title)
    releaseYear = try values.decode(Int.self, forKey: .releaseYear)
  }
}

if let person = try? decoder.decode([Person].self, from: jsonMovie) {
  print(person)
} else {
  print("fail")
}



/***************************************************
 4번 문제
 - 다음 URL의 Repository 정보 중에서 다음 속성만을 골라서 데이터 모델로 만들고 출력
 - full_name, description, stargazers_count, forks_count, html_url
 - https://api.github.com/search/repositories?q=user:giftbott
 - 위 URL의 user 부분을 자신의 아이디로 변경
 ***************************************************/
print("\n---------- [ 4번 문제 (Movie) ] ----------\n")
struct Repositories: Decodable {
  var items: [Data]
  
  struct Data: Decodable {
    var full_name: String
    var description: String?
    var stargazers_count: Int
    var forks_count: Int
    var html_url: String
  }
}

func fetchGitHubRepositories() {
  let urlString = "https://api.github.com/search/repositories?q=user:Chang-Geun-Ryu"
  print(urlString)
  let url = URL(string: urlString)!
  let jsonData = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard error == nil else { return print(error?.localizedDescription)}
    guard let response = response as? HTTPURLResponse,
      200..<400 ~= response.statusCode else { return print("HTTPURLResponse error")}
    guard let data = data,
      let repo = try? JSONDecoder().decode(Repositories.self, from: data)else { return print("fail")}
    
    repo.items.forEach {
      print($0)
    }
  }
  jsonData.resume()
}

fetchGitHubRepositories()



//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)
