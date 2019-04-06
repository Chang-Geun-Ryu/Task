//
//  ViewController.swift
//  LoginExample
//
//  Created by CHANGGUEN YU on 05/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

//[ 로그인 페이지 필수 구현 기능 ]
//1. 이미지와 동일하게 UI 구현  (스토리보드와 코드 자유)
//2. 텍스트 필드는 UITextFieldDelegate 이용
//3. 키보드에 textField 가 가릴 수 있으므로 키보드가 나타날 때는 텍스트필드 위로 끌어올리고 내려갈 때는 같이 내려가기
//4. 미리 설정해둔 아이디와 비밀번호가 동일할 경우 로그인이 완료된 메인 화면으로 이동
//5. 메인 화면에서는 입력받은 아이디를 출력하는 Label 을 띄우고 다시 로그인 화면으로 돌아갈 수 있는 Sign Out 버튼 구성
//
//[ 로그인 페이지 옵션 기능 ]
//1. 미리 설정해둔 아이디와 비밀번호가 다를 경우 텍스트필드의 바탕화면을 일시적으로 빨갛게 만들었다가 원상 복구하기
//
//(아래 2 ~ 3번은 delegate 메서드로 구현하기 어려워하실 것이므로 editingChanged를 이용해 먼저 구현)
//(더 해보고 싶을 때 delegate 메서드로 추가 고민)
//2. 텍스트필드에 입력할 수 있는 최대 글자 수는 20자까지
//3. 아이디와 비밀번호는 모두 4 ~ 16자 사이여야 함
//
//[ 도전 과제 ]
//1. 자동 로그인
//한 번 로그인에 성공했으면 Sign Out을 하기 전에는 앱을 껏다 켜도 자동 로그인된 상태로 메인 화면으로 진입
//(AppDelegate 접근 방법 참고)
//(let appDelegate = UIApplication.shared.delegate as! AppDelegate)
//
//2.
//회원가입 페이지를 만든 뒤 회원 가입한 유저의 아이디와 비밀번호를 추가하고
//그것으로도 로그인 할 수 있도록 구현하기

import UIKit

class ViewController: UIViewController {
    static var users:[String:String] = ["aaaa":"bbbb"]
    
    var loginStatus = false
    var loginUser: String?
    
    var inputID = ""
    var inputPW = ""
    
    var emailTF: UITextField?
    var passwordTF: UITextField?
    var login: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let logoImage = UIImageView(image: UIImage(named: "fastcampus_logo1"))
        logoImage.frame = CGRect(x: 50, y: 150, width: 300, height: 100)
        view.addSubview(logoImage)
        
        let loginView = UIView(frame: CGRect(x: view.frame.width/2 - 150, y: view.frame.height/2 + 100, width: 300, height: 200))
        
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
        
        passwordTF = UITextField(frame: CGRect(x: loginView.bounds.origin.x + 60, y: loginView.bounds.origin.y + 110, width: 250, height: 50))
        passwordTF?.placeholder = "비밀번호를 입력하세요"
        passwordTF?.delegate = self
        passwordTF?.layer.cornerRadius = 20
        passwordTF?.borderStyle = .roundedRect
        passwordTF?.isSecureTextEntry = true
        
        loginView.addSubview(emailTF!)
        loginView.addSubview(passwordTF!)
        
        let radiusView = UIView(frame: CGRect(x: view.frame.width/2 - 45, y: 250, width: 20, height: 20))
        radiusView.layer.cornerRadius = 5
        radiusView.backgroundColor = #colorLiteral(red: 0.8657182455, green: 0.2217845321, blue: 0.309904784, alpha: 1)
        view.addSubview(radiusView)
        let radiusView1 = UIView(frame:  CGRect(x: view.frame.width/2 - 15, y: 250, width: 20, height: 20))
        radiusView1.layer.cornerRadius = 5
        radiusView1.backgroundColor = #colorLiteral(red: 0.8657182455, green: 0.2217845321, blue: 0.309904784, alpha: 1)
        view.addSubview(radiusView1)
        let radiusView2 = UIView(frame:  CGRect(x: view.frame.width/2 + 15, y: 250, width: 20, height: 20))
        radiusView2.layer.cornerRadius = 5
        radiusView2.backgroundColor = #colorLiteral(red: 0.8657182455, green: 0.2217845321, blue: 0.309904784, alpha: 1)
        view.addSubview(radiusView2)
        
        view.addSubview(loginView)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 25, y: view.frame.height - 150, width: view.frame.width - 50, height: 50)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        view.addSubview(button)
        
        login = loginView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if loginStatus {
            showSecondView(id: loginUser!, false)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    }
    
    @objc func signIn(_ sender: UIButton) {
        guard ViewController.users.keys.contains(inputID) else {
            emailTF?.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1 ) {
                self.emailTF?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            return
        }
        guard ViewController.users[inputID] == inputPW else {
            passwordTF?.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1 ) {
                self.passwordTF?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            return
        }
        
        showSecondView(id: inputID, true)
    }
    
    func showSecondView(id: String, _ animated: Bool) {
        let secondVC = SecondViewController()
        secondVC.textID = id
        secondVC.view.backgroundColor = .white
        
        present(secondVC, animated: true)
    }
    
    func clearInfo() {
        inputID = ""
        inputPW = ""
        emailTF?.text?.removeAll()
        passwordTF?.text?.removeAll()
        UserDefaults.standard.set(false, forKey: "Login")
        UserDefaults.standard.set("", forKey: "User")
        loginStatus = false
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 1) {
            self.login!.frame.origin.y = self.view.frame.height/2 - 100
        }
        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailTF {
            inputID = textField.text ?? ""
        } else if textField == self.passwordTF {
            inputPW = textField.text ?? ""
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard textField.text?.count ?? 0 <= 20 else { return false }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UIView.animate(withDuration: 1) {
            self.login!.frame.origin.y = self.view.frame.height/2 + 100
        }
        textField.resignFirstResponder()
        return true
    }
}
