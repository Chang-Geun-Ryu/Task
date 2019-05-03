//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

protocol LinkedListStack {
  private var head: Node?
  private weak var tail: Node?
  var isEmpty: Bool
  var count: Int
  
  func scanValues()                              //- 현재 저장된 모든 노드의 값 출력
  func removeAll()                               //- 모든 노드 제거
  func removeNode(by value: String) -> Bool      //- 밸류를 이용해 노드 제거 후 성공 여부
  func removeNode(at index: Int) -> String?      //- 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
  func node(by value: String) -> Node?           //- 지정한 값을 지닌 노드를 찾아 반환
  func insert(node newNode: Node, at index: Int) //- 특정 위치에 노드 삽입
  func append(node: Node)                        //- 마지막 부분에 노드 삽입
}

class Node {
  let value: String
  var first: Node?
  var last: Node?
  
  init(value: String) {
    self.value = value
  }
}

class DoubleLinkedList: LinkedListStack {
  var count: Int = 0
  var isEmpty: Bool { return head == nil }
  private var head: Node?
  private weak var tail: Node?
  
  var lastNode: Node? {
    guard var node = head else { return nil }
    while let nextNode = node.next {
      node = nextNode
    }
    return node
  }
  
  func scanValues() {                             //- 현재 저장된 모든 노드의 값 출력
  
  }
  
  func removeAll()  {                             //- 모든 노드 제거
    head = nil
    tail = nil
    count = 0
  }
  
  func removeNode(by value: String) -> Bool {     //- 밸류를 이용해 노드 제거 후 성공 여부
    
    count = 0
  }
  
  func removeNode(at index: Int) -> String? {     //- 인덱스를 이용해 노드 제거 후 삭제한 노드의 밸류 반환
  
    count += 1
  }
  
  func node(by value: String) -> Node? {          //- 지정한 값을 지닌 노드를 찾아 반환
  }
  
  func insert(node newNode: Node, at index: Int) {//- 특정 위치에 노드 삽입
  }
  
  func append(newNode: Node) {                    //- 마지막 부분에 노드 삽입
    guard let node = head else {
      head = newNode
      tail = newNode
      return
    }
    
    newNode.first = tail
    tail?.last = newNode
    tail = newNode
    
    count += 1
  }
}

let linkedList = SingleLinkedList()
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
