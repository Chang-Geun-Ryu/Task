//
//  SecondViewController.swift
//  PatternExample
//
//  Created by CHANGGUEN YU on 04/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

protocol textFieldDelegate {
    func setText(_ label : UILabel?)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var delegate: textFieldDelegate?
    
    //static var stringLabel = ""
    var stringLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //label.text = UserDefaults.standard.string(forKey: "text") //- UserDefaults 를 이용한 방법으로 구현
        //label.text = SecondViewController.stringLabel // - Singleton 을 이용한 방법으로 구현
        delegate?.setText(label)
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
