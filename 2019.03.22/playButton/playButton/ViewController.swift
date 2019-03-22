//
//  ViewController.swift
//  playButton
//
//  Created by CHANGGUEN YU on 22/03/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.

/*
[ 과제 ]
- UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
- UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
*/

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var switchOnOff: UISwitch!
    @IBOutlet weak var showSwitchStatus: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var showSegmentControlStatus: UILabel!
    
    var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Viewcontroller")
        
        plusButton.addTarget(self, action: #selector(plus(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minus(_:)), for: .touchUpInside)
        switchOnOff.addTarget(self, action: #selector(switchOnOff(_:)), for: .touchUpInside)
        segmentControl.addTarget(self, action: #selector(showSegmentControlButton(_:)), for: .valueChanged)
        
        numberLabel.text = String(number)
        
        showSegmentControlButton(segmentControl)
        switchOnOff(switchOnOff)
        
    }
    
    @objc func showSegmentControlButton(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            showSegmentControlStatus.text = "First"
        case 1:
            showSegmentControlStatus.text = "Second"
        default:
            showSegmentControlStatus.text = "뭐여?"
        }
    }
    
    @objc func switchOnOff(_ sender: UISwitch) {
        if switchOnOff.isOn {
            showSwitchStatus.text = "ON"
            showSwitchStatus.textColor = .green
        } else {
            showSwitchStatus.text = "OFF"
            showSwitchStatus.textColor = .gray
        }
    }
    
    @objc func plus(_ sender: UIButton) {
        number += 1
        
        numberLabel.text = String(number)
        numberLabel.textColor = .blue
    }
    @objc func minus(_ sender: UIButton) {
        number -= 1
        
        numberLabel.text = String(number)
        numberLabel.textColor = .red
    }
    
   
}

