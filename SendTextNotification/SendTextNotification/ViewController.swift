//
//  ViewController.swift
//  SendTextNotification
//
//  Created by giftbot on 28/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private weak var senderTextField: UITextField!

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default
      .post(name: Notification.Name("SendTextNotification"), object: senderTextField)
  }

  @IBAction private func didEndOnExit(_ sender: UITextField) {}
  @IBAction private func editingDidEnd(_ sender: Any) {
    performSegue(withIdentifier: "ShowSecondVC", sender: nil)
  }
}

