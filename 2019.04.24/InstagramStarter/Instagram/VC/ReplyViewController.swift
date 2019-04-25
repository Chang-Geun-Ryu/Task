//
//  ReplyViewController.swift
//  Instagram
//
//  Created by CHANGGUEN YU on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class 고정아 {
  
}

protocol CommentsInputDelegate: class {
  func addComments(comment: String)
}

class ReplyViewController: UIViewController {
  
  weak var delegate: CommentsInputDelegate?
  
  let tableView = UITableView()
  let addCommentView = UIView()
  
  let commentTextfield = UITextField()
  let smileButton = UIButton(type: .system)
  let cryButton = UIButton(type: .system)
  let blackButton = UIButton(type: .system)
  let angryButton = UIButton(type: .system)
  let heartButton = UIButton(type: .system)
  let bigHeartButton = UIButton(type: .system)
  let clappingButton = UIButton(type: .system)
  let catButton = UIButton(type: .system)
  
  weak var feed: FeedData?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "댓글"
    addCommentView.backgroundColor = .green
    view.addSubview(tableView)
    view.addSubview(addCommentView)
    
    smileButton.setTitle("😀", for: .normal)
    cryButton.setTitle("😂", for: .normal)
    blackButton.setTitle("👾", for: .normal)
    angryButton.setTitle("😡", for: .normal)
    heartButton.setTitle("😍", for: .normal)
    bigHeartButton.setTitle("❤️", for: .normal)
    clappingButton.setTitle("🙌", for: .normal)
    catButton.setTitle("🐈", for: .normal)
    
    commentTextfield.textAlignment = .left
    commentTextfield.placeholder = "댓글달기...."
    commentTextfield.borderStyle = .roundedRect
    commentTextfield.layer.cornerRadius = 100
    commentTextfield.delegate = self
    addCommentView.addSubview(commentTextfield)
    
    addCommentView.addSubview(smileButton)
    addCommentView.addSubview(cryButton)
    addCommentView.addSubview(blackButton)
    addCommentView.addSubview(angryButton)
    addCommentView.addSubview(heartButton)
    addCommentView.addSubview(bigHeartButton)
    addCommentView.addSubview(clappingButton)
    addCommentView.addSubview(catButton)
    
    autoLayout()
    
    tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: "Cell")
    tableView.dataSource = self
  }
  
  func autoLayout(){
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    self.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    self.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    self.tableView.bottomAnchor.constraint(equalTo: addCommentView.topAnchor).isActive = true
    
    addCommentView.translatesAutoresizingMaskIntoConstraints = false
    addCommentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    addCommentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    addCommentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    addCommentView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
    addCommentView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    
    commentTextfield.translatesAutoresizingMaskIntoConstraints = false
    commentTextfield.bottomAnchor.constraint(equalTo: addCommentView.bottomAnchor, constant: -10).isActive = true
    commentTextfield.leadingAnchor.constraint(equalTo: addCommentView.leadingAnchor, constant: 10).isActive = true
    commentTextfield.trailingAnchor.constraint(equalTo: addCommentView.trailingAnchor, constant: -10).isActive = true
    commentTextfield.topAnchor.constraint(equalTo: smileButton.bottomAnchor, constant: 10).isActive = true
    
    let buttonArray = [smileButton, cryButton, blackButton, angryButton, heartButton, bigHeartButton, clappingButton, catButton]
    
    buttonArray.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.addTarget(self, action: #selector(addEmoji(_:)), for: .touchUpInside)
    }
    
    buttonArray.first?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    buttonArray.first?.topAnchor.constraint(equalTo: addCommentView.topAnchor).isActive = true
    buttonArray.first?.widthAnchor.constraint(equalTo: addCommentView.widthAnchor, multiplier: 1 / CGFloat(buttonArray.count)).isActive = true
    buttonArray.first?.heightAnchor.constraint(equalToConstant: 50).isActive = true
    buttonArray.last?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    buttonArray.last?.topAnchor.constraint(equalTo: addCommentView.topAnchor).isActive = true
    buttonArray.last?.widthAnchor.constraint(equalTo: addCommentView.widthAnchor, multiplier: 1 / CGFloat(buttonArray.count)).isActive = true
    buttonArray.last?.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    for i in 1..<buttonArray.count - 1 {
      buttonArray[i].leadingAnchor.constraint(equalTo: buttonArray[i-1].trailingAnchor).isActive = true
      buttonArray[i].topAnchor.constraint(equalTo: addCommentView.topAnchor).isActive = true
      buttonArray[i].widthAnchor.constraint(equalTo: addCommentView.widthAnchor, multiplier: 1 / CGFloat(buttonArray.count)).isActive = true
      buttonArray[i].heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    print("asdf", 1 / CGFloat(buttonArray.count))
    tableView.backgroundColor = .red
  }
  
  func setComments(feed: FeedData) {
    self.feed = feed
  }
  
  @objc func addEmoji(_ sender: UIButton){
    commentTextfield.text = commentTextfield.text! + sender.currentTitle!
  }
  
}

extension ReplyViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return feed?.comments?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentTableViewCell
    
    cell.setComment(
      image: feed?.profileImage ?? "",
      user: feed?.nickName ?? "",
      comment: feed?.comments?[indexPath.row] ?? "")
    return cell
  }
}

extension ReplyViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    guard let text = textField.text, !text.isEmpty else { return true }
    
    feed?.comments?.append(text)
    
    textField.text = ""
    tableView.reloadData()
    return true
  }
}
