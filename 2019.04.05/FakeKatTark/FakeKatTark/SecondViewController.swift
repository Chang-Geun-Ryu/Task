//
//  SecondViewController.swift
//  FakeKatTark
//
//  Created by CHANGGUEN YU on 06/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

protocol FreindNameAddDelegate: class {
//    func getFrandNames() -> [String]?
    func addFreind(_ freinds: [String])
}

class SecondViewController: UIViewController {
    weak var delegate: FreindNameAddDelegate?
    var addFreind: UITextField?
    var freindArray: [String] = []
    var freindName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addFreind = UITextField(frame: CGRect(x: 50, y: view.frame.height/3, width: view.frame.width - 100, height: 80))
        addFreind?.font = UIFont.systemFont(ofSize: 50)
        addFreind?.borderStyle = .roundedRect
        addFreind?.layer.cornerRadius = 20
        addFreind?.delegate = self //(presentingViewController as! ViewController).self
        addFreind?.textAlignment = .center
        addFreind?.placeholder = "친구 이름 입력"
        
        view.addSubview(addFreind!)
        
        let addButton = UIButton(type: .system)
        addButton.frame = CGRect(x: 150, y: view.frame.height/3 + 100, width: view.frame.width - 300, height: 80)
        addButton.setTitle("추가", for: .normal)
        addButton.layer.cornerRadius = 15
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        addButton.addTarget(self, action: #selector(addFreindTouchUpInside), for: .touchUpInside)
        
        view.addSubview(addButton)
    }
    
    @objc func addFreindTouchUpInside(_ sender: UIButton) {
        addFreind!.resignFirstResponder()
        guard !freindName.isEmpty else { return alert(title: "Error", message: "이름을 입력 하세요")}
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return alert(title: "Error", message: "이름을 입력 하세요")}
//        guard let navi = appDelegate.tabBarController?.selectedViewController as? UINavigationController else { return print("fail")}
//        guard let vc = navi.viewControllers[0] as? ViewController else { return print("fail")}
        guard !freindArray.contains(freindName) else { return alert(title: "Error", message: "중복된 이름 존재 같은 이름의 친구랑 사귀지마라!")}
        
        freindArray.append(freindName)
        delegate?.addFreind(freindArray)
        
        alert(title: "Success", message: freindName+"(를)을 친구등록 합니다")
        freindName.removeAll()
        addFreind?.text?.removeAll()
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        present(alert, animated: true)
    }
}


extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        freindName = textField.text ?? ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            freindName = textField.text ?? "" + string
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        freindName = textField.text ?? ""
//        print(freindName, "aa")
        freindName = textField.text ?? ""
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
         freindName = textField.text ?? ""
        return true
    }
}
