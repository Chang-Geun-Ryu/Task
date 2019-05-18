//
//  GetURLViewController.swift
//  SlackNewWorkspace
//
//  Created by CHANGGUEN YU on 16/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GetURLViewController: UIViewController {
  
  private let nextButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Next", for: .normal)
    button.setTitleColor(.lightGray, for: .normal)
        button.setTitleColor(.init(red: 18/255, green: 90/255, blue: 153/255, alpha: 1.0), for: .selected)
    button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
    return button
  }()
  
  private let closeButton: UIButton = {
    let button = UIButton(type: .custom)
    let closeImage = UIImage(named: "btnClose")!
    button.setImage(closeImage, for: .normal)
    button.addTarget(self, action: #selector(didTapCloseButton(_:)), for: .touchUpInside)
    return button
  }()
  
  private let URLTextField: UITextField = {
    let textField = UITextField()
    textField.enablesReturnKeyAutomatically = true
    textField.borderStyle = .none
    textField.returnKeyType = .go
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    return textField
  }()
  private var actURLTextViewLeadingConst: NSLayoutConstraint!
  
  private let getURLLabel: UILabel = {
    let label = UILabel()
    label.text = "Get a URL (Letters, numbers, and dashes only)"
    label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
    return label
  }()
  
  private let activityLabel: UILabel = {
    let label = UILabel()
    label.text = ".slack.com"
    label.font = UIFont.systemFont(ofSize: 20, weight: .light)
    label.alpha = 0.5
    return label
  }()
  private var actLabelLeadingConst: NSLayoutConstraint!
  
  private let textLabel: UILabel = {
    let label = UILabel()
    label.text = "This is the address that you'll use to sign in to Slack"
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.alpha = 0.7
    return label
  }()
  
  private let sorryLabel: UILabel = {
    let label = UILabel()
    label.text = "This URL is not available. Sorry!"
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.alpha = 0
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
  
  private func setupViews() {
    view.backgroundColor = .white
    view.addSubviews([nextButton, closeButton])
    view.addSubviews([URLTextField, getURLLabel, activityLabel, textLabel, sorryLabel])
    
    navigationController?.navigationBar.isHidden = true
    URLTextField.delegate = self
  }
  
  private func setupConstraints() {
    nextButton.layout.top().trailing(constant: -16)
    closeButton.layout
      .leading(constant: 16)
      .centerY(equalTo: nextButton.centerYAnchor)
    actURLTextViewLeadingConst = URLTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor)
    actURLTextViewLeadingConst.constant = 16
    actURLTextViewLeadingConst.isActive = true
    URLTextField.layout
      .trailing(constant: -16)
      .centerY(constant: -115)// = UILayoutPriority(500)
    
    
    getURLLabel.layout.bottom(equalTo: URLTextField.topAnchor, constant: -10).leading(constant: 16)
    
    activityLabel.layout.centerY(equalTo: URLTextField.centerYAnchor)
    
    actLabelLeadingConst = activityLabel.leadingAnchor.constraint(equalTo: URLTextField.leadingAnchor)
    actLabelLeadingConst.isActive = true
    
    textLabel.layout.top(equalTo: URLTextField.bottomAnchor, constant: 100).leading(constant: 16)
    sorryLabel.layout.top(equalTo: URLTextField.bottomAnchor, constant: 10).leading(constant: 16)
    
    guard let text = URLTextField.text else { return }
    
    let textSize = (text as NSString).size(withAttributes: [.font: URLTextField.font!])
    print(textSize)
    actLabelLeadingConst.constant = textSize.width
    
  }
  
  func setURL(inText: String) {
    URLTextField.text = inText
  }
  
  @objc func didTapNextButton(_ sender: UIButton) {
    
    guard URLTextField.text == "error" else { return }
    
    sorryLabel.alpha = 0.7
    
    UIView.animateKeyframes(withDuration: 0.2, delay: 0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.33, animations: {
        self.actURLTextViewLeadingConst.constant -= 10
        self.view.layoutIfNeeded()
      })
      UIView.addKeyframe(withRelativeStartTime: 0.33, relativeDuration: 0.33, animations: {
        self.actURLTextViewLeadingConst.constant += 20
        self.view.layoutIfNeeded()
      })
      UIView.addKeyframe(withRelativeStartTime: 0.66, relativeDuration: 0.33, animations: {
        self.actURLTextViewLeadingConst.constant -= 10
        self.view.layoutIfNeeded()
      })
    })
  }
  
  @objc func didTapCloseButton(_ sender: UIButton) {
    dismiss(animated: true)
  }
}

extension GetURLViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard range.location < 25 else { return false }
    let text = textField.text ?? ""
    let textSize = (text as NSString).size(withAttributes: [.font: URLTextField.font!])
    
    actLabelLeadingConst.constant = range.length == 1 ? textSize.width - 8 : textSize.width + 8
    
    print("shouldChangeCharactersIn", textSize.width + 8, range, range.location)
    sorryLabel.alpha = 0
    nextButton.isSelected = range.location == 0 && range.length == 1 ? false : true
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    didTapNextButton(nextButton)
    return true
  }
}
