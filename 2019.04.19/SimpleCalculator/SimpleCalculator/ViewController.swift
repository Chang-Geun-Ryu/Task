//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by giftbot on 15/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

  @IBOutlet weak var leftOperandTextField: UITextField!
  @IBOutlet weak var rightOperandTextField: UITextField!
  @IBOutlet weak var operatorTextField: UITextField!
  
  @IBAction func displayResult(_ sender: Any) {
    let (title, message) = calculateOperation()
    showAlert(title: title, message: message)
  }
  
  private func calculateOperation() -> (String, String) {
    guard let leftOperand = leftOperandTextField.text,
      let rightOperand = rightOperandTextField.text,
      let leftNum = Double(leftOperand),
      let rightNum = Double(rightOperand)
      else { return ("오류", "올바른 피연산자(실수)를 입력해주세요.") }
    guard let op = operatorTextField.text, op.count == 1 else {
      return ("오류", "올바른 연산자를 입력해주세요. (+, -, *, /)")
    }
    
    let result: Double
    switch op {
    case "+": result = leftNum + rightNum
    case "-": result = leftNum - rightNum
    case "*": result = leftNum * rightNum
    case "/": result = leftNum / rightNum
    default: return ("오류", "올바른 연산자를 입력해주세요. (+, -, *, /)")
    }
    return ("결과", "\(leftNum) \(op) \(rightNum) = \(String(format: "%.3f", result))")
  }
  
  private func showAlert(title: String, message: String) {
    let alertController = UIAlertController(
      title: title, message: message, preferredStyle: .alert
    )
    let okAction = UIAlertAction(title: "확인", style: .default)
    alertController.addAction(okAction)
    present(alertController, animated: true)
  }
}

