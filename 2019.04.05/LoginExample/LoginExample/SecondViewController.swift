//
//  SecondViewController.swift
//  LoginExample
//
//  Created by CHANGGUEN YU on 05/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var textID = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let labelID = UILabel(frame: CGRect(x: 50, y: 100, width: view.frame.width - 100, height: 80))
        labelID.textColor = .darkGray
        labelID.textAlignment = .center
        labelID.font = UIFont.systemFont(ofSize: 50)
        labelID.text = textID
        
        view.addSubview(labelID)
        
        let buttonLogOut = UIButton(type: .system)
        buttonLogOut.frame = CGRect(x: view.frame.width/2 - 100, y: view.frame.height/2 - 50, width: 200, height: 100)
        buttonLogOut.setTitle("Log Out", for: .normal)
        buttonLogOut.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        buttonLogOut.setTitleColor(.cyan, for: .normal)
        buttonLogOut.addTarget(self, action: #selector(logOutTouchUpInside), for: .touchUpInside)
        
        view.addSubview(buttonLogOut)
        
        UserDefaults.standard.set(true, forKey: "Login")
        UserDefaults.standard.set(textID, forKey: "User")
    }
    
    @objc func logOutTouchUpInside(_ sender: UIButton) {
        guard let vc = presentingViewController as? UITabBarController else{
            return print("aa")
        }
        
        //if let vc = presentingViewController as? ViewController {
        guard let vc1 = vc.selectedViewController as? ViewController else {
            return
        }
            vc1.clearInfo()
            vc1.dismiss(animated: true)
//        }else {
//            let irstVC = ViewController()
//             let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        }
        
    }
    
    func restartApplication() {
        let viewController = ViewController()
        
        guard
            let window = UIApplication.shared.keyWindow
            //            , let rootViewController = window.rootViewController
            else {
                return
        }
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
            window.rootViewController = viewController
        })
        
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
