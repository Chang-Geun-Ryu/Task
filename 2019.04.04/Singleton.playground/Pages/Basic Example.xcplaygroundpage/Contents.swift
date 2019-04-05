//: [Previous](@previous)

class User {
  static let shared = User()
//  private init() {}
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends {
  let name: String
}

struct FriendList {
  mutating func addFriend(name: String) {
//    let user = User()
//    let friend = Friends(name: name)
//    user.friends.append(friend)
    // "원빈", "장동건", "정우성" 3명을 친구로 추가했을 때
    // 최종적으로 user.friends 에 들어있는 friend 의 숫자는?
    
    let user = User.shared
    let friend = Friends(name: name)
    user.friends.append(friend)
  }
}

struct BlockList {
  mutating func blockFriend(name: String) {
    let friend = Friends(name: name)
    if let index = User.shared.friends.firstIndex(where: { $0.name == friend.name }) {
      User.shared.friends.remove(at: index)
    }
    if !User.shared.blocks.contains(where: { $0.name == friend.name }) {
      User.shared.blocks.append(friend)
    }
  }
}

var friendList = FriendList()
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")
User.shared.friends


var blockList = BlockList()
blockList.blockFriend(name: "원빈")
User.shared.friends
User.shared.blocks

let userInit = User()
userInit.friends
userInit.blocks

let userShared = User.shared
userShared.friends
userShared.blocks

//[ 도전 과제 ]
//1.
//Singleton 플레이그라운드의 Basic Example 에서 Singleton 을 이용해 구현한 내용을
//User 클래스에 싱글턴 패턴을 사용하지 않고도 동일한 결과가 나오도록 구현해보기
//(User 클래스 내용은 싱글턴을 제거하는 것 외에 건드리지 않아야 함. 타입 프로퍼티도 사용하지 않고 구현)
//
//(1-1. 도전 과제의 심화 문제: 위 도전 과제의 User를 class 로 구현했으면 struct로 변경하여 구현해보기)
class User1 {
    var friends: [Friends1] = []
    var blocks: [Friends1] = []
}

struct Friends1 {
    let name: String
}

struct FriendList1 {
    mutating func addFriend(user: User1, name: String) {
        let friend = Friends1(name: name)
        user.friends.append(friend)
    }
}

struct BlockList1 {
    mutating func blockFriend(user: User1, name: String) {
        let friend = Friends1(name: name)
        if let index = user.friends.firstIndex(where: { $0.name == friend.name }) {
            user.friends.remove(at: index)
        }
        if !user.blocks.contains(where: { $0.name == friend.name }) {
            user.blocks.append(friend)
        }
    }
}

let user1 = User1()

var friendList1 = FriendList1()
friendList1.addFriend(user: user1, name: "원빈")
friendList1.addFriend(user: user1, name: "장동건")
friendList1.addFriend(user: user1, name: "정우성")
user1.friends

var blockList1 = BlockList1()
blockList1.blockFriend(user: user1, name: "원빈")
user1.friends
user1.blocks


// 도전과제 1-1 User class -> struct
struct User1_1 {
    var friends: [Friends1_1] = []
    var blocks: [Friends1_1] = []
}

struct Friends1_1 {
    let name: String
}

struct FriendList1_1 {
    mutating func addFriend(user: User1_1, name: String) -> User1_1 {
        let users = User1_1(friends: user.friends + [Friends1_1(name: name)], blocks: [])
        return users
    }
}

struct BlockList1_1 {
    mutating func blockFriend(user: User1_1, name: String) -> User1_1{
        var users = User1_1(friends: user.friends, blocks: user.blocks)
        
        if let index = user.friends.firstIndex(where: { $0.name == name }) {
            users.friends.remove(at: index)
        }
        if !user.blocks.contains(where: { $0.name == name }) {
            users.blocks.append(Friends1_1(name: name))
        }
        return users
    }
}


var user1_1 = User1_1()

var friendList1_1 = FriendList1_1()
user1_1 = friendList1_1.addFriend(user: user1_1, name: "원빈")
user1_1 = friendList1_1.addFriend(user: user1_1, name: "장동건")
user1_1 = friendList1_1.addFriend(user: user1_1, name: "정우성")
user1_1.friends

var blockList1_1 = BlockList1_1()
user1_1 = blockList1_1.blockFriend(user: user1_1, name: "원빈")
user1_1.friends
user1_1.blocks
//: [Next](@next)
