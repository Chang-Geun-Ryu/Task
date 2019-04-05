//
//  SecondViewController.swift
//  PatternExample
//
//  Created by CHANGGUEN YU on 04/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var string = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = string
    }
    
}

extension SecondViewController: textFieldDelegate {
    func setText(_ textField : UITextField?) {
        //guard let la = label else { return }
        string = textField?.text ?? ""
    }
}
