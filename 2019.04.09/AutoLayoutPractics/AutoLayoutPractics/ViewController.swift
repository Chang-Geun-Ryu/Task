//
//  ViewController.swift
//  AutoLayoutPractics
//
//  Created by CHANGGUEN YU on 09/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let viewFirst = UIView()
        viewFirst.backgroundColor = .black
        view.addSubview(viewFirst)
        
        let viewSecond = UIView()
        viewSecond.backgroundColor = .red
        view.addSubview(viewSecond)

        let viewThird = UIView()
        viewThird.backgroundColor = .blue
        view.addSubview(viewThird)

        let viewFifth = UIView()
        viewFifth.backgroundColor = .orange
        view.addSubview(viewFifth)

        let viewFivth = UIView()
        viewFivth.backgroundColor = .red
        view.addSubview(viewFivth)
        
        viewFirst.translatesAutoresizingMaskIntoConstraints = false
        viewSecond.translatesAutoresizingMaskIntoConstraints = false
        viewThird.translatesAutoresizingMaskIntoConstraints = false
        viewFifth.translatesAutoresizingMaskIntoConstraints = false
        viewFivth.translatesAutoresizingMaskIntoConstraints = false
        
        viewFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        viewFirst.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        viewFirst.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        viewFirst.widthAnchor.con
        
        
        viewSecond.topAnchor.constraint(equalTo: viewFirst.topAnchor).isActive = true
        viewSecond.leadingAnchor.constraint(equalTo: viewFirst.trailingAnchor, constant: 8).isActive = true
        viewSecond.heightAnchor.constraint(equalTo: viewFirst.heightAnchor).isActive = true
        viewSecond.widthAnchor.constraint(equalTo: viewFirst.widthAnchor, multiplier: 0.7, constant: -1).isActive = true
        
        viewThird.topAnchor.constraint(equalTo: viewSecond.topAnchor).isActive = true
        viewThird.leadingAnchor.constraint(equalTo: viewSecond.trailingAnchor, constant: 8).isActive = true
        viewThird.heightAnchor.constraint(equalTo: viewSecond.heightAnchor).isActive = true
        viewThird.widthAnchor.constraint(equalTo: viewSecond.widthAnchor, multiplier: 0.7, constant: -2).isActive = true
        
        viewFifth.topAnchor.constraint(equalTo: viewThird.topAnchor).isActive = true
        viewFifth.leadingAnchor.constraint(equalTo: viewThird.trailingAnchor, constant: 8).isActive = true
        viewFifth.heightAnchor.constraint(equalTo: viewThird.heightAnchor).isActive = true
        viewFifth.widthAnchor.constraint(equalTo: viewThird.widthAnchor, multiplier: 0.7, constant: -3).isActive = true
        
        viewFivth.topAnchor.constraint(equalTo: viewFifth.topAnchor).isActive = true
        viewFivth.leadingAnchor.constraint(equalTo: viewFifth.trailingAnchor, constant: 8).isActive = true
        viewFivth.heightAnchor.constraint(equalTo: viewFifth.heightAnchor).isActive = true
        viewFivth.widthAnchor.constraint(equalTo: viewFifth.widthAnchor, multiplier: 0.7, constant: -4).isActive = true
        viewFivth.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
    }


}

