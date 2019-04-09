//
//  ViewController.swift
//  BogusAlertController
//
//  Created by CHANGGUEN YU on 09/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let buttonAlert = UIButton(type: .system)
        buttonAlert.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        buttonAlert.setTitle("Alert", for: .normal)
        buttonAlert.setTitleColor(.white, for: .normal)
        buttonAlert.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        buttonAlert.layer.cornerRadius = 30
        buttonAlert.addTarget(self, action: #selector(alert), for: .touchUpInside)
        
        view.addSubview(buttonAlert)
        
        buttonAlert.translatesAutoresizingMaskIntoConstraints = false
        buttonAlert.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        buttonAlert.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        buttonAlert.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buttonAlert.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    @objc func alert(_ sender: UIButton) {
        let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .overCurrentContext
        secondVC.delegate = self
        present(secondVC, animated: true)
    }

}

extension ViewController: BackGroundColor {
    func colorChange(_ color: UIColor) {
        self.view.backgroundColor = color
    }
}
