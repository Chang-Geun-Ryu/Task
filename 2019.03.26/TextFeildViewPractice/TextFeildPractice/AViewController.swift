//
//  AViewController.swift
//  TextFeildPractice
//
//  Created by CHANGGUEN YU on 26/03/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    var label: UILabel?
    var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.number += 1
        view.backgroundColor = .red
        
        let showLabel = UILabel()
        showLabel.frame = CGRect(x: view.frame.width/10, y: view.frame.height/6, width: view.frame.width - view.frame.width/5, height: 80)
        showLabel.textColor = .black
        showLabel.textAlignment = .center
        showLabel.font = UIFont.systemFont(ofSize: 50)
        showLabel.text = String(self.number)
        view.addSubview(showLabel)
        label = showLabel
        
        let button = UIButton(frame: CGRect(x: view.frame.width/10, y: view.frame.height/4, width: view.frame.width - view.frame.width/5, height: 80))
        button.setTitle("To BView", for: .normal)
        button.tintColor = .black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.addTarget(self, action: #selector(goSomeView), for: .touchUpInside)
        button.tag = 0
        view.addSubview(button)
        
        let exitButton = UIButton(frame: CGRect(x: view.frame.width/10, y: view.frame.height/3, width: view.frame.width - view.frame.width/5, height: 80))
        exitButton.setTitle("Exit", for: .normal)
        exitButton.tintColor = .black
        exitButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        exitButton.addTarget(self, action: #selector(goSomeView), for: .touchUpInside)
        exitButton.tag = 1
        view.addSubview(exitButton)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //label?.text = String(self.number)
    }
    
    @objc func goSomeView(_ sender: UIButton) {
        if sender.tag == 0 {
            let buttonBView = BViewController()
            buttonBView.number = self.number
            present(buttonBView, animated: true)
        } else {
            if let vc = presentingViewController as? ViewController{
                vc.number = self.number
                vc.numberLabel?.text = String(self.number)
                vc.dismiss(animated: true)
            } else if let vcA = presentingViewController as? AViewController{
                vcA.number = self.number
                vcA.label?.text = String(self.number)
                vcA.dismiss(animated: true)
            } else if let vcB = presentingViewController as? BViewController{
                vcB.number = self.number
                vcB.label?.text = String(self.number)
                vcB.dismiss(animated: true)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
