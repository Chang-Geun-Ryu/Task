//
//  NameWSViewController.swift
//  SlackNewWorkspace
//
//  Created by giftbot on 16/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import AudioToolbox.AudioServices
import UIKit

class NameWSViewController: UIViewController {
  
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
  
  private let wsNameTextField: UITextField = {
    let textField = UITextField()
    let attrString = NSAttributedString(
      string: "Name your workspace",
      attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
    )
    textField.attributedPlaceholder = attrString
    textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
    textField.enablesReturnKeyAutomatically = true
    textField.borderStyle = .none
    textField.returnKeyType = .go
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    return textField
  }()
  
  private let floatingLabel: UILabel = {
    let label = UILabel()
    label.text = "Name your workspace"
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    label.alpha = 0
    return label
  }()
  private var floatingCenterYConst: NSLayoutConstraint!
  
  private let activityIndicatorView: UIActivityIndicatorView = {
    let indicatorView = UIActivityIndicatorView(style: .gray)
    indicatorView.hidesWhenStopped = true
    return indicatorView
  }()
  private var indicatorViewLeadingConst: NSLayoutConstraint!
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    wsNameTextField.becomeFirstResponder()
  }
  
  private func setupViews() {
    view.backgroundColor = .white
    view.addSubviews([nextButton, closeButton])
    view.addSubviews([wsNameTextField, floatingLabel ,activityIndicatorView])
    
    navigationController?.navigationBar.isHidden = true
    wsNameTextField.delegate = self
  }
  
  private func setupConstraints() {
    nextButton.layout.top().trailing(constant: -16)
    closeButton.layout
      .leading(constant: 16)
      .centerY(equalTo: nextButton.centerYAnchor)
    wsNameTextField.layout
      .leading(constant: 16)
      .trailing(constant: -16)
      .centerY(constant: -115)
    
    floatingLabel.layout
      .leading(equalTo: wsNameTextField.leadingAnchor)
    let defaultCenterYConst = floatingLabel.centerYAnchor
      .constraint(equalTo: wsNameTextField.centerYAnchor)
    defaultCenterYConst.priority = UILayoutPriority(500)
    defaultCenterYConst.isActive = true
    
    floatingCenterYConst = floatingLabel.centerYAnchor
      .constraint(equalTo: wsNameTextField.centerYAnchor, constant: -30)
    floatingCenterYConst.priority = .defaultLow
    floatingCenterYConst.isActive = true
    
    activityIndicatorView.layout.centerY(equalTo: wsNameTextField.centerYAnchor)
    indicatorViewLeadingConst = activityIndicatorView.leadingAnchor.constraint(equalTo: wsNameTextField.leadingAnchor)
    indicatorViewLeadingConst.isActive = true
  }
  
  private func vibration() {
    // kSystemSoundID_Vibrate 4095
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    
  }
  
  @objc func didTapNextButton(_ sender: UIButton) {
    guard nextButton.isSelected, let text = wsNameTextField.text else { return vibration()}
    guard !activityIndicatorView.isAnimating else { return }
    
    let textSize = (text as NSString).size(withAttributes: [.font: wsNameTextField.font!])
    indicatorViewLeadingConst.constant = textSize.width + 8
    activityIndicatorView.startAnimating()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.activityIndicatorView.stopAnimating()
      // 다음 뷰 컨드롤러 띄우기
      // text를 다음 뷰 컨트롤러에 넘기
      let getVC = GetURLViewController()
      getVC.setURL(inText: text)
      self.present(getVC, animated: true)
    }
  }
  
  @objc func didTapCloseButton(_ sender: UIButton) {
    dismiss(animated: true)
  }
}


// MARK: - UITextFieldDelegate

extension NameWSViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    didTapNextButton(nextButton)
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = textField.text ?? ""
    let replacedText = (text as NSString).replacingCharacters(in: range, with: string)
    nextButton.isSelected = !replacedText.isEmpty
    
    UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
      if replacedText.isEmpty {
        self.floatingCenterYConst.priority = .defaultLow
        self.floatingLabel.alpha = 0.0
      } else {
        self.floatingCenterYConst.priority = .defaultHigh
        self.floatingLabel.alpha = 1.0
      }
      self.view.layoutIfNeeded() // 지금바로 UI 변결 실행 Autolayout 일때 실행
    })
    
    return true
  }
}

