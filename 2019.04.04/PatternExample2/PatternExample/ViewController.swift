//
//  ViewController.swift
//  PatternExample
//
//  Created by CHANGGUEN YU on 04/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

//1.
//FirstVC 의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
//- UserDefaults 를 이용한 방법으로 구현
//- Singleton 을 이용한 방법으로 구현
//- Delegate 를 이용한 방법으로 구현

import UIKit

protocol textFieldDelegate: class {
    func setText(_ textField : UITextField?)
}

class ViewController: UIViewController{
    @IBOutlet weak var textField: UITextField!
    weak var delegate: textFieldDelegate?
    let secondVC = SecondViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        guard let secondVC = segue.destination as? SecondViewController else {
            return
        }
        delegate = secondVC.self
        
        delegate?.setText(textField)
    }
    
    @IBAction func editingChanged(_ sender: UITextField) {
    }
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func unwindToFirstView(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
    }
    
    
    @IBAction func touchUpInside(_ sender: UIButton) {
        
        
        present(secondVC, animated: true)
        
        
    }
}
