//
//  SecondViewController.swift
//  SendTextNotification
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {
  
  @IBOutlet private weak var receiverLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self,
      selector: #selector(receivedText(_:)),
      name: NSNotification.Name("SendTextNotification"),
      object: nil
    )
  }
  
  @objc private func receivedText(_ sender: Notification) {
    print(sender)
    receiverLabel.text = (sender.object as? UITextField)?.text
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
}
