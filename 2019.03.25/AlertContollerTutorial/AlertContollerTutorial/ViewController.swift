//
//  ViewController.swift
//  AlertContollerTutorial
//
//  Created by CHANGGUEN YU on 25/03/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let button = UIButton(type: .system)
    let label = UILabel()
    var clickNumber: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.frame = CGRect(x: view.frame.width / 3, y: view.frame.height / 3, width: 150, height: 150)
        button.setTitle("입력", for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 55)//UIFont(name: "System", size: 55)
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        label.frame = CGRect(x: view.frame.width / 3, y: view.frame.height / 2, width: 150, height: 150)
        label.text = "0"
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 55)
        label.textAlignment = .center
        
        view.addSubview(label)
    }
    
    @objc func didTapButton(_ sender: Any) {
        let alertController = UIAlertController(title: "타이틀", message: "메시지", preferredStyle: .alert)
        
        alertController.addTextField() { (text) in
            text.placeholder = "only numbers"
            
        }
        
        let Up = UIAlertAction(title: "Up", style: .default) { _ in
            
            if alertController.textFields?[0].text?.isEmpty == false , let num = String?((alertController.textFields?[0].text)!){
                self.label.text = alertController.textFields?[0].text
               self.clickNumber = Int(num)!
            } else {
                self.label.textColor = .blue
                self.clickNumber += 1
                self.label.text = String(self.clickNumber)
            }
        }
        let Down = UIAlertAction(title: "Down", style: .default) { _ in
            self.label.textColor = .red
            self.clickNumber -= 1
            self.label.text = String(self.clickNumber)
        }
        let cancelAction = UIAlertAction(title: "Cancle", style: .cancel, handler: nil)
        let reset = UIAlertAction(title: "Reset", style: .destructive) { _ in
            print("Reset")
            self.clickNumber = 0
            self.label.text = String(self.clickNumber)
        }
        
        
        alertController.addAction(Up)
        alertController.addAction(Down)
        alertController.addAction(cancelAction)
        alertController.addAction(reset)
        
        present(alertController, animated: true)
    }
    

}

