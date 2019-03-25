//
//  ViewController.swift
//  FramePractice
//
//  Created by CHANGGUEN YU on 25/03/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupSuperview4()
       // setupSuperview3()
       // setupSuperview1()
       // setupSuperview2()
    }
    
    func setupSuperview4() -> UIView {
        let blueView = UIView()
        let redView = UIView()
        let greenView = UIView()
        let startPoint: CGFloat = 30
        let marginalSpace: CGFloat = 60
        
        blueView.frame = CGRect(x: startPoint, y: startPoint, width: super.view.frame.width - marginalSpace, height: super.view.frame.height - marginalSpace)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        redView.frame = CGRect(x: startPoint, y: startPoint, width: blueView.frame.width - marginalSpace, height: blueView.frame.height - marginalSpace)
        redView.backgroundColor = .red
        blueView.addSubview(redView)
        
        greenView.frame = CGRect(x: startPoint, y: startPoint, width: redView.frame.width - marginalSpace, height: redView.frame.height - marginalSpace)
        greenView.backgroundColor = .green
        redView.addSubview(greenView)
        
        return greenView
    }
    
    func setupSuperview3() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 15, y: 15, width: super.view.frame.width - 30, height: 100)
        greenView.backgroundColor = .blue
        view.addSubview(greenView)
        return greenView
    }
    
    
    func setupSuperview1() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    
    func setupSuperview2() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
}

