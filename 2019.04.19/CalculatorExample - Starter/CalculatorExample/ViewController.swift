//
//  ViewController.swift
//  CalculatorExample
//
//  Created by giftbot on 17/04/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    
    var store: Double = 0
    var number: Double? = nil
    var operatorClosure: ((Double, Double) -> Double)? = nil
    var addString: String = ""
    let numformat = NumberFormatter()
    
  override func viewDidLoad() {
    super.viewDidLoad()
        result.adjustsFontSizeToFitWidth = true
    
        numformat.numberStyle = .decimal
        numformat.minimumFractionDigits = 0
        numformat.maximumFractionDigits = 3
        clear()
    }
    
    func goAlert() {
        let alert = UIAlertController(title: "연산 가능한 한계 수를 초과했습니다.", message: "초기화 진행합니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    
    func clear() {                          // 전체 초기화 function
        store = 0
        setResultLabel(0)
        clearoperated()
    }
    func clearoperated() {                  // 연산 후 초기화 function
        number = nil
        operatorClosure = nil
        addString = ""
    }
    
    func setResultLabel(_ value: Double) {
        result.text = numformat.string(from: value as NSNumber)!
    }
    
    func equal(equalButtonClicked: Bool,_ numberButtonClicked: Bool = false) {
        
        if store == 0, !numberButtonClicked  {                     // store 프로퍼티가 0이면 number 프로퍼티로부터 값을 받고 number는 nil
            store = number ?? 0
            number = nil
            addString = ""
        } else if store != 0 && number == nil, equalButtonClicked{ // 12 + =  결과: 12, 작동을 위한 조건
            number = store
        }
        
        
        guard store != 0, number != nil, operatorClosure != nil else { return }
        
        store = operatorClosure!(store, number!)   // 계산
        setResultLabel(store)                      // 자릿수에 맞춰 출력
        clearoperated()                            // 계산후 초기화
    }
    
    // AC button
    @IBAction func clearAll(_ sender: UIButton) {   // AC 버튼 클릭으로 초기화 진행
        clear()
    }
    
    // 0~9 button
    @IBAction func keyNumber(_ sender: UIButton) {
        guard addString.count < 15 else { return }
        addString += sender.titleLabel?.text ?? ""  // 숫자키 입력시 누적 시키기위하여 String 프로퍼티에 누적시켜 label에 출력
        number = Double(addString)
        setResultLabel(number ?? 0)
        
        equal(equalButtonClicked: false, true)
    }
    
    // +-×÷ operator button
    @IBAction func keyOperator(_ sender: UIButton) {
        switch sender.titleLabel?.text {            // 버튼의 label.text에 따라 operatorClosure에 +-×÷ 연산자를 입력
        case "+":
            operatorClosure = (+)
        case "-":
            operatorClosure = (-)
        case "×":
            operatorClosure = (*)
        case "÷":
            operatorClosure = (/)
        default:
            operatorClosure = nil
        }
        
        equal(equalButtonClicked: false)    // 연산자 버튼 클릭으로 호출된것을 equal function에 매개변수를 false로 알림
    }
    
    // = button
    @IBAction func equaOperatorl(_ sender: UIButton) {
        guard operatorClosure != nil else { // =, equal 버튼 클릭시 operatorClosure가 nil 값으로 연산자를 지정하지 않았으면 초기화
            clearoperated()
            return
        }
    
        equal(equalButtonClicked: true)     // =, equal 버튼 클릭으로 호출된것을 equal fucntion에 매배변수를 true로 알림
    }
}
