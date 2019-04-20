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
    var number: Double? = 0
    var operatorClosure: ((Double, Double) -> Double)? = nil
    var addString: String = ""
    var equalClicked = 0
    let numformat = NumberFormatter()
    
  override func viewDidLoad() {
    super.viewDidLoad()
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
        result.text = "0"
        equalClicked = 0
        clearoperated()
    }
    func clearoperated() {                  // 연산 후 초기화 function
        number = nil
        operatorClosure = nil
        addString = ""
    }
    
    func equal(equalButtonClicked: Bool) {
        if store == 0 {                     // store 프로퍼티가 0이면
            store = number ?? 0
            number = nil
            addString = ""
        } else if store != 0 && number == nil, equalButtonClicked{
            number = store
        }
        
        print("store: \(store), number: \(number ?? 0), equalClicked: \(equalClicked)")
        guard store != 0, number != nil, equalClicked < 2, operatorClosure != nil else { print("FF", equalClicked); return }
        
        store = operatorClosure!(store, number!)                // 계산
        result.text = numformat.string(from: store as NSNumber) // 자릿수에 맞춰 출력
        clearoperated()                                         // 계산후 초기화
    }
    
    // AC button
    @IBAction func clearAll(_ sender: UIButton) {   // AC 버튼 클릭으로 초기화 진행
        clear()
    }
    
    // 0~9 button
    @IBAction func keyNumber(_ sender: UIButton) {
        addString += sender.titleLabel?.text ?? ""  // 숫자키 입력시 누적 시키기위하여 String 프로퍼티에 누적시켜 label에 출력
        number = Double(addString) ?? 0
        result.text = addString
    }
    
    // +-×÷ operator button
    @IBAction func keyOperator(_ sender: UIButton) {
        switch sender.titleLabel?.text {            // 버튼의 label.text에 따라 operatorClosure에 +-×÷ 연산자를 입력
        case "+":
            operatorClosure = {$0 + $1}
        case "-":
            operatorClosure = {$0 - $1}
        case "×":
            operatorClosure = {$0 * $1}
        case "÷":
            operatorClosure = {$0 / $1}
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
