//
//  ThirdViewController.swift
//  LoginExample
//
//  Created by CHANGGUEN YU on 06/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var emailTF: UITextField?
    var passwordTF: UITextField?
    var password2TF: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        view.backgroundColor = .blue
        let loginView = UIView(frame: CGRect(x: view.frame.width/2 - 150, y: view.frame.height/2 - 200, width: 300, height: 500))
        
        let emailImage = UIImageView(image: UIImage(named: "email"))
        emailImage.frame = CGRect(x: loginView.bounds.origin.x, y: loginView.bounds.origin.y + 10, width: 30, height: 30)
        loginView.addSubview(emailImage)
        
        let pwsImage = UIImageView(image: UIImage(named: "password"))
        pwsImage.frame = CGRect(x: loginView.bounds.origin.x, y: loginView.bounds.origin.y + 110, width: 30, height: 30)
        loginView.addSubview(pwsImage)
        
        emailTF = UITextField(frame: CGRect(x: loginView.bounds.origin.x + 60, y: loginView.bounds.origin.y + 10, width: 250, height: 50))
        emailTF?.placeholder = "이메일을 입력하세요"
        emailTF?.delegate = self
        emailTF?.layer.cornerRadius = 20
        emailTF?.borderStyle = .roundedRect
        
        passwordTF = UITextField(frame: CGRect(x: loginView.bounds.origin.x + 60, y: loginView.bounds.origin.y + 80, width: 250, height: 50))
        passwordTF?.placeholder = "비밀번호를 입력하세요"
        passwordTF?.delegate = self
        passwordTF?.layer.cornerRadius = 20
        passwordTF?.borderStyle = .roundedRect
        passwordTF?.isSecureTextEntry = true
        
        password2TF = UITextField(frame: CGRect(x: loginView.bounds.origin.x + 60, y: loginView.bounds.origin.y + 150, width: 250, height: 50))
        password2TF?.placeholder = "비밀번호를 다시 입력하세요"
        password2TF?.delegate = self
        password2TF?.layer.cornerRadius = 20
        password2TF?.borderStyle = .roundedRect
        password2TF?.isSecureTextEntry = true
        
        loginView.addSubview(emailTF!)
        loginView.addSubview(passwordTF!)
        loginView.addSubview(password2TF!)
        
        view.addSubview(loginView)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 25, y: view.frame.height/2 + 50, width: view.frame.width - 50, height: 50)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(signAdd), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.setTitle("Sign Add", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        view.addSubview(button)
    }
    
    @objc func signAdd(_ sender: UIButton) {
        guard 4...16 ~= emailTF?.text?.count ?? 0 else { return alart(title: "이메일", message: "알아서 넣어")}
        guard 4...16 ~= passwordTF?.text?.count ?? 0 else { return alart(title: "페스워드", message: "알아서 넣어")}
        guard !ViewController.users.keys.contains(emailTF?.text ?? "") else { return alart(title: "이미있는 ID", message: "알아서 넣어")}
        guard passwordTF?.text == password2TF?.text else { return alart(title: "패스워드 확인점", message: "알아서 넣어")}
        
        ViewController.users.updateValue(password2TF?.text ?? "", forKey: emailTF?.text ?? "")
        
        alart(title: "Title", message: "Message")
    }
    
    func alart(title: String, message: String) {
        let alart = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlat = UIAlertAction(title: "확인", style: .default)
        
        alart.addAction(okAlat)
        
        present(alart, animated: true)
    }
}

extension ThirdViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField.text?.count ?? 0 <= 20 else { return false }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
