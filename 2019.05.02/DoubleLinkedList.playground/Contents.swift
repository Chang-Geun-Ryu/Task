import UIKit

var str = "Hello, playground"



class Node {
  let value: String
  var first: Node?
  var last: Node?
  
  init(value: String) {
    self.value = value
  }
}

class DoubleLinkedList {
  var count: Int = 0
  var isEmpty: Bool { return head == nil }
  private var head: Node?
  private weak var tail: Node?
  
  var nodeValues: [String] {
    guard var node = head else { return [] }
    var values: [String] = []
    values.append(node.value)
    while let nextNode = node.last {
      values.append(nextNode.value)
      node = nextNode
    }
    return values
  }
  
  func scanValues() {                             //- 현재 저장된 모든 노드의 값 출력
    print(nodeValues)
  }
  
  func removeAll()  {                             //- 모든 노드 제거
    head = nil
    tail = nil
    count = 0
  }
  
  func removeNode(by value: String) -> Bool {     //- 밸류를 이용해 노드 제거 후 성공 여부
    guard var node = head else {
      print("!")
      return false
    }
    
    guard node.value != value else {
      head = node.last
      head?.first = nil
      count -= 1
      return true
    }
    
    while let nextNode = node.last {
      node = nextNode
      if node.value == value {break}
    }
    
    let prevNode = node.first
    let nextNode = node.last
    
    prevNode?.last = nextNode
    nextNode?.first = prevNode
    
    node.first = nil
    node.last = nil
    
    count -= 1
    return true
  }
  
  func removeNode(at index: Int) -> String? {     //- 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
    guard var node = head, count > index else {
      print("!")
      return nil
    }
    
    guard node.first != nil else {
      head = node.last
      let value = node.value
      head?.first = nil
      count -= 1
      return value
    }
    
    for _ in 0..<index {
      guard let nextNode = node.last else { print("!!"); return nil }
      node = nextNode
    }
    
    let value = node.value
    let prevNode = node.first
    let nextNode = node.last
    
    prevNode?.last = nextNode
    nextNode?.first = prevNode
    
    node.first = nil
    node.last = nil
    
    count -= 1
    return value
  }
  
  func node(by value: String) -> Node? {          //- 지정한 값을 지닌 노드를 찾아 반환
    guard var node = head else { return nil }
    while let nextNode = node.last {
      node = nextNode
      if value == node.value { break }
    }
    return node
  }
  
  func insert(node newNode: Node, at index: Int) {//- 특정 위치에 노드 삽입
    guard var node = head, count > index else {
      print("!")
      append(node: newNode)
      return
    }
    
    for _ in 0..<index {
      guard let nextNode = node.last else { print("!!"); append(node: newNode); return }
      
      node = nextNode
    }
    let prevNode = node.first
    
    newNode.last = node
    newNode.first = prevNode
    prevNode?.last = newNode
    node.first = newNode
    
    count += 1
  }
  
  func append(node newNode: Node) {//- 마지막 부분에 노드 삽입
    count += 1
    guard head != nil else {
      head = newNode
      tail = newNode
      print(newNode.value)
      return
    }
    
    newNode.first = tail
    tail?.last = newNode
    tail = newNode
    print(count)
  }
}

let linkedList = DoubleLinkedList()
linkedList.append(node: Node(value: "1"))
linkedList.append(node: Node(value: "2"))
linkedList.append(node: Node(value: "3"))
linkedList.append(node: Node(value: "4"))
linkedList.append(node: Node(value: "5"))
linkedList.append(node: Node(value: "6"))
linkedList.scanValues()
linkedList.insert(node: Node(value: "A"), at: 3)
linkedList.scanValues()
linkedList.insert(node: Node(value: "B"), at: 3)
let node = linkedList.node(by: "B")
print(node?.value)
linkedList.scanValues()
linkedList.removeNode(at: 0)
linkedList.scanValues()
linkedList.removeNode(by: "A")
linkedList.scanValues()
linkedList.removeAll()
linkedList.scanValues()
/***************************************************
 더블 링크드 리스트
 
 [ 프로퍼티 ]
 private var head: Node?
 private weak var tail: Node?
 var isEmpty: Bool
 var first: Node?
 var last: Node?
 var count: Int
 
 [ 메서드 ]
 scanValues()  - 현재 저장된 모든 노드의 값 출력
 removeAll()   - 모든 노드 제거
 removeNode(by value: String) -> Bool      - 밸류를 이용해 노드 제거 후 성공 여부
 removeNode(at index: Int) -> String?      - 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
 node(by value: String) -> Node?           - 지정한 값을 지닌 노드를 찾아 반환
 insert(node newNode: Node, at index: Int) - 특정 위치에 노드 삽입
 append(node: Node)                        - 마지막 부분에 노드 삽입
 ***************************************************/

//class Node
