//
//  ViewController.swift
//  CalculaterExample1
//
//  Created by CHANGGUEN YU on 19/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let operandLeft = UITextField()
    let operandRight = UITextField()
    let operatorMid = UITextField()
    
    let operandLeftLabel = UILabel()
    let operandRightLabel = UILabel()
    let operatorMidLabel = UILabel()
    
    let calcButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        operandLeft.frame = CGRect(x: 20, y: 150, width: 110, height: 50)
//        operandLeft.backgroundColor = .red
        operandLeft.textAlignment = .center
        operandLeft.font = UIFont.systemFont(ofSize: 40)
        operandLeft.borderStyle = .line
        
        operatorMid.frame = CGRect(x: operandLeft.frame.width + 40, y: 150, width: 110, height: 50)
//        operatorMid.backgroundColor = .blue
        operatorMid.textAlignment = .center
        operatorMid.font = UIFont.systemFont(ofSize: 40)
        operatorMid.borderStyle = .line

        operandRight.frame = CGRect(x: operandLeft.frame.width * 2 + 60, y: 150, width: 110, height: 50)
//        operandRight.backgroundColor = .orange
        operandRight.textAlignment = .center
        operandRight.font = UIFont.systemFont(ofSize: 40)
        operandRight.borderStyle = .line
        
        operandLeftLabel.frame = CGRect(x: 20, y: 100, width: 110, height: 50)
        operandLeftLabel.textAlignment = .center
        operandLeftLabel.text = "피연산자1"
        
        operatorMidLabel.frame = CGRect(x: operandLeftLabel.frame.width + 40, y: 100, width: 110, height: 50)
        operatorMidLabel.text = "연산자"
        operatorMidLabel.textAlignment = .center
        
        operandRightLabel.frame = CGRect(x: operandLeftLabel.frame.width * 2 + 60, y: 100, width: 110, height: 50)
        operandRightLabel.text = "피연산자"
        operandRightLabel.textAlignment = .center
        
        calcButton.frame = CGRect(x: 20, y: 210, width: operandLeftLabel.frame.width * 3 + 40, height: 50)
        calcButton.backgroundColor = .darkGray
        calcButton.setTitle("결과 확인", for: .normal)
        calcButton.setTitleColor(.white, for: .normal)
        calcButton.addTarget(self, action: #selector(calc), for: .touchUpInside)
        
        view.addSubview(calcButton)
        view.addSubview(operandRightLabel)
        view.addSubview(operatorMidLabel)
        view.addSubview(operandLeftLabel)
        view.addSubview(operandLeft)
        view.addSubview(operatorMid)
        view.addSubview(operandRight)
    }
    
    @objc func calc(_ sender: UIButton) {
        guard let left = Double(operandLeft.text ?? ""), let mid = operatorMid.text, let right = Double(operandRight.text ?? "") else {
            
            let alert = UIAlertController(title: "Error", message: "정확히 기입해주세요", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            
            present(alert, animated: true)
            return
        }
        
        var message = "aa"
        print(left, right)
        switch mid {
        case "+":
            message = String.init(format: "%.3f \(mid) %.3f = %.3f" , arguments: [left, right, left + right])
            
        case "-":
            message = String.init(format: "%.3f \(mid) %.3f = %.3f" , arguments: [left, right, left - right])
        case "*":
            message = String.init(format: "%.3f \(mid) %.3f = %.3f" , arguments: [left, right, left * right])
        case "/":
            message = String.init(format: "%.3f \(mid) %.3f = %.3f" , arguments: [left, right, left / right])
        default:
            message = "Error"
        }

        
        let alert = UIAlertController(title: "계산결과", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }

}

