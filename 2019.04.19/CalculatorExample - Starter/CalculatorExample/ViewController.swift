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
    
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    @IBOutlet weak var num0: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var mulButton: UIButton!
    @IBOutlet weak var divButton: UIButton!
    
    @IBOutlet weak var equlButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    var store: Double = 0
    var number: Double = 0
    var operatorClosure: ((Double, Double) -> Double)? = nil
    var addString: String = ""
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
        clear()
    }
    
    func goAlert() {
        let alert = UIAlertController(title: "연산 가능한 한계 수를 초과했습니다.", message: "초기화 진행합니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
    
    func clear() {
        store = 0
        result.text = "0"
        clearoperated()
    }
    func clearoperated() {
        number = 0
        operatorClosure = nil
        addString = ""
        
    }
    
    func equal() {
        guard store != 0, number != 0, operatorClosure != nil else {return}
        store = operatorClosure!(store, number)
        
        guard store <= Double.greatestFiniteMagnitude else {
            print("!")
            goAlert()
            clear()
            return
        }
        guard store >= Double.leastNormalMagnitude else {
            print("@")
            goAlert()
            clear()
            return}
        
        print("4 store: \(store), number: \(number)")
        print(Double.greatestFiniteMagnitude)
        
        let numformat = NumberFormatter()
        numformat.numberStyle = .decimal
        numformat.minimumFractionDigits = 0
        numformat.maximumFractionDigits = 3
        
        result.text = numformat.string(from: store as NSNumber)
        
        clearoperated()
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        clear()
    }
    
    @IBAction func keyNumber(_ sender: UIButton) {
        addString += sender.titleLabel?.text ?? ""
        number = Double(addString) ?? 0
        result.text = addString
    }
    
    @IBAction func keyOperator(_ sender: UIButton) {
        switch sender {
        case addButton:
            operatorClosure = {$0 + $1}
        case subButton:
            operatorClosure = {$0 - $1}
        case mulButton:
            operatorClosure = {$0 * $1}
        case divButton:
            operatorClosure = {$0 / $1}
        default:
            operatorClosure = nil
        }
        print("1 store: \(store), number: \(number)")
        
        if store == 0 {
            store = number
            number = 0
            addString = ""
        }
        
        print("2 store: \(store), number: \(number)")
        equal()
    }
    
    @IBAction func equaOperatorl(_ sender: UIButton) {
        guard operatorClosure != nil else {
            print("a")
            clearoperated()
            return
        }
        equal()
    }
    
    
}
