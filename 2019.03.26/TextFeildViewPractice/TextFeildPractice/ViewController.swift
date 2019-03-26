//
//  ViewController.swift
//  TextFeildPractice
//
//  Created by CHANGGUEN YU on 26/03/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var feild: UITextField?
    var label: UILabel?
    var numberLabel: UILabel?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textFeild = UITextField(frame: CGRect(x: view.frame.width/10, y: view.frame.height/4, width: view.frame.width - view.frame.width/5, height: 80))
        
        textFeild.textColor = .black
        textFeild.textAlignment = .center
        textFeild.borderStyle = .roundedRect
        textFeild.font = UIFont.systemFont(ofSize: 20)
        textFeild.addTarget(self, action: #selector(editDidBegin), for: .editingDidBegin)
        textFeild.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        textFeild.addTarget(self, action: #selector(editDidEnd), for: .editingDidEnd)
        textFeild.addTarget(self, action: #selector(didEndOnExit), for: .editingDidEndOnExit)
        view.addSubview(textFeild)
        
        feild = textFeild
        
        let showLabel = UILabel()
        showLabel.frame = CGRect(x: view.frame.width/10, y: view.frame.height/6, width: view.frame.width - view.frame.width/5, height: 80)
        showLabel.text = "go texting!"
        showLabel.textColor = .black
        showLabel.textAlignment = .center
        showLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(showLabel)
        
        label = showLabel
        
        let buttonAView = UIButton(frame: CGRect(x: view.frame.width/10, y: 400, width: view.frame.width - view.frame.width/5, height: 80))
        buttonAView.setTitle("To AView", for: .normal)
        buttonAView.tintColor = .black
        buttonAView.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        buttonAView.addTarget(self, action: #selector(goSomeView), for: .touchUpInside)
        buttonAView.tag = 0
        view.addSubview(buttonAView)
        
        let buttonBView = UIButton(frame: CGRect(x: view.frame.width/10, y: 500, width: view.frame.width - view.frame.width/5, height: 80))
        buttonBView.setTitle("To BView", for: .normal)
        buttonBView.tintColor = .black
        buttonBView.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        buttonBView.addTarget(self, action: #selector(goSomeView), for: .touchUpInside)
        buttonBView.tag = 1
        view.addSubview(buttonBView)
        
        let numberAB = UILabel(frame: CGRect(x: view.frame.width/10, y: 700, width: view.frame.width - view.frame.width/5, height: 80))
        numberAB.text = String(self.number)
        numberAB.textColor = .black
        numberAB.textAlignment = .center
        numberAB.font = UIFont.systemFont(ofSize: 50)
        numberAB.text = String(self.number)
        view.addSubview(numberAB)
        numberLabel = numberAB
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        numberLabel?.text = String(self.number)
    }
    
    @objc func goSomeView(_ sender: UIButton) {
        if sender.tag == 0 {
            let AView = AViewController()
            AView.number = self.number
            present(AView, animated: true)
        } else {
            let BView = BViewController()
            BView.number = self.number
            present(BView, animated: true)
        }
    }
    
    @objc func didEndOnExit(_ sender: UITextField) {
    }
    
    @objc func editDidBegin(_ sender: UITextField) {
        //print("didbegin")
        label?.textColor = .blue
        label?.font = UIFont.systemFont(ofSize: 40)
    }
    
    @objc func editingChanged(_ sender: UITextField) {
        //print("changed")
        guard let text = sender.text else{return}
        label?.text = text
    }
    
    @objc func editDidEnd(_ sender: UITextField) {
        //print("didend")
        label?.textColor = .red
        label?.font = UIFont.systemFont(ofSize: 20)
    }

}

