//
//  ViewController.swift
//  FakeKatTark
//
//  Created by CHANGGUEN YU on 06/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    var freindsLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if #available(iOS 11.0, *){ // 버전 분기
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        let barButton = UIBarButtonItem(title: "친구추가", style: .done, target: self, action: #selector(addViewController(_:)))
        navigationItem.rightBarButtonItem = barButton
        
        freindsLabel = UILabel(frame: CGRect(x: 50, y: 200, width: view.frame.width - 100, height: view.frame.height - 400))
        freindsLabel?.backgroundColor = .blue
        freindsLabel?.font = UIFont.systemFont(ofSize: 30)
        freindsLabel?.textAlignment = .center
        freindsLabel?.numberOfLines = 0
        
        view.addSubview(freindsLabel!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc private func addViewController(_ sender: Any) {
        let secondVC = SecondViewController()
        secondVC.delegate = self
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension ViewController: FreindNameAddDelegate {
    
    func addFreind(_ freinds: [String]) {
        var freindList = ""
        for name in freinds {
            freindList += name + "\n"
        }
        
        freindsLabel?.text = freindList
    }
    
    
}
