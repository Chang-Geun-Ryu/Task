//
//  CommentTableViewCell.swift
//  Instagram
//
//  Created by CHANGGUEN YU on 24/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
  let userView = UIImageView()
  let userLabel = UILabel()
  let commentLabel = UILabel()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
//    fatalError("init(coder:) has not been implemented")
  }
  
  func setComment(image: String, user: String, comment: String){
    userView.image = UIImage(named: image)
    userView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
    
    userLabel.text = user
    commentLabel.text = comment
    
    contentView.addSubview(userView)
    contentView.addSubview(userLabel)
    contentView.addSubview(commentLabel)
    
    userView.translatesAutoresizingMaskIntoConstraints = false
    userView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    userView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    userView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    userView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    userView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    userLabel.translatesAutoresizingMaskIntoConstraints = false
    userLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    userLabel.leadingAnchor.constraint(equalTo: userView.trailingAnchor, constant: 10).isActive = true
    userLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    userLabel.bottomAnchor.constraint(equalTo: commentLabel.topAnchor).isActive = true
    
    commentLabel.translatesAutoresizingMaskIntoConstraints = false
    commentLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor).isActive = true
    commentLabel.leadingAnchor.constraint(equalTo: userView.trailingAnchor, constant: 10).isActive = true
    commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code

  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}

