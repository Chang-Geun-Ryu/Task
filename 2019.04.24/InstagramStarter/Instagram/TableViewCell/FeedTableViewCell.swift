//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by CHANGGUEN YU on 17/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol ReplyDelegate: class {
  func replyButtonTap(_ feedData: FeedData)
}

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
  
  var comments: [String]?
  weak var delegate: ReplyDelegate?
    
    var model: FeedData! {
        didSet {
            profileImageView.image = UIImage(named: self.model.profileImage!)
            nickNameLabel.text = self.model.nickName
            feedImageView.image = UIImage(named: self.model.feedImage!)
          comments = self.model.comments
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
//        feedImageView.image = UIImage(named: AppImageData.profile + "\(1)")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle() // 클릭시 값변경
    }
  
  @IBAction func replyButtondidTap(_ sender: UIButton) {
    print("ss")
    delegate?.replyButtonTap(model)
  }
  
}
