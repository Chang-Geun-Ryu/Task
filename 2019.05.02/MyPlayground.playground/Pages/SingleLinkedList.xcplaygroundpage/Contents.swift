import UIKit

var str = "Hello, playground"

print("a")

protocol LinkedListStack {
  var size: Int { get }     // 전체 개수
  var isEmpty: Bool { get } // 노드가 있는지 여부
  var head: Node? { get }   // 링크드 리스트 시작 지점
  func push(node: Node)     // 데이터 삽입
  func pop() -> String?     // 데이터 추출
  func peek() -> String?    // 마지막 데이터 확인
}

class Node {
  let value: String
  var next: Node?
  
  init(value: String) {
    self.value = value
  }
}

class SingleLinkedList: LinkedListStack {
  var size: Int = 0
  var isEmpty: Bool { return head == nil }
  
  var head: Node?
  var lastNode: Node? {
    guard var node = head else { return nil }
    while let nextNode = node.next {
      node = nextNode
    }
    return node
  }
  
  func push(node newNode: Node) {
    size += 1
    guard let node = lastNode else { head = newNode; return }
    node.next = newNode
  }
  
  func pop() -> String? {
    size = size > 0 ? size - 1 : 0
    guard var node = head else { return nil }
    guard node.next != nil else {
      head = nil
      return node.value
    }
    
    while let nextNode = node.next {
      guard nextNode.next != nil else {
        node.next = nil
        return nextNode.value
      }
      node = nextNode
    }
    
    return node.value
  }
  
  func peek() -> String? {
    return lastNode?.value
  }
  
  // 0부터 시작
  func insert(at index: Int, insertNode: Node) -> Bool {
    guard size >= index else { return false}
    size += 1
    guard var node = head else {
      head = insertNode
      return true
    }
    guard index > 0 else {
      insertNode.next = head
      head = insertNode
      return true
    }
    
    var prevNode: Node?
    for _ in 0..<index {
      prevNode = node
      guard let nextNode = node.next else { size -= 1; return false }
      node = nextNode
    }
    
    insertNode.next = node
    prevNode?.next = insertNode
    
    return true
  }
  
}

let linkedList = SingleLinkedList()
linkedList.isEmpty

linkedList.push(node: Node(value: "1"))
linkedList.push(node: Node(value: "2"))
linkedList.push(node: Node(value: "3"))
linkedList.push(node: Node(value: "4"))
linkedList.push(node: Node(value: "5"))
linkedList.push(node: Node(value: "6"))
linkedList.peek()
linkedList.size
linkedList.insert(at: 2, insertNode: Node(value: "A"))
linkedList.size

print(linkedList)
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
//print(linkedList.size)
//
//linkedList.isEmpty
//linkedList.pop()
//linkedList.push(node: Node(value: "C"))
//linkedList.size
//
//linkedList.pop()
//linkedList.pop()
//linkedList.pop()
//linkedList.size
//linkedList.isEmpty
