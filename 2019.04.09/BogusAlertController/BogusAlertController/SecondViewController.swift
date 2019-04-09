//
//  SecondViewController.swift
//  BogusAlertController
//
//  Created by CHANGGUEN YU on 09/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

protocol BackGroundColor: class {
    func colorChange(_ color: UIColor)
}

class SecondViewController: UIViewController {
    
    var delegate: BackGroundColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let alertView = UIView()
        alertView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        alertView.layer.cornerRadius = 50
        view.addSubview(alertView)
        
        let textLabel = UILabel()
        textLabel.text = "색을 변경하시겠습니까?"
        textLabel.font = UIFont.systemFont(ofSize: 30)
        textLabel.textColor = .white
        textLabel.textAlignment = .center
        view.addSubview(textLabel)
        
        let buttonYellow = UIButton(type: .system)
        buttonYellow.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        buttonYellow.setTitle("노랑", for: .normal)
        buttonYellow.setTitleColor(.white, for: .normal)
        buttonYellow.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        buttonYellow.layer.cornerRadius = 50
        buttonYellow.tag = 0
        buttonYellow.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        view.addSubview(buttonYellow)
        
        let buttonWhite = UIButton(type: .system)
        buttonWhite.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        buttonWhite.setTitle("흰색", for: .normal)
        buttonWhite.setTitleColor(.white, for: .normal)
        buttonWhite.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        buttonWhite.layer.cornerRadius = 50
        buttonWhite.tag = 1
        buttonWhite.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        view.addSubview(buttonWhite)
        
        let buttonConfirm = UIButton(type: .system)
        buttonConfirm.backgroundColor = .white
        buttonConfirm.setTitle("확인", for: .normal)
        buttonConfirm.setTitleColor(.black, for: .normal)
        buttonConfirm.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        buttonConfirm.addTarget(self, action: #selector(backFirstView), for: .touchUpInside)
        buttonConfirm.layer.cornerRadius = 20
        view.addSubview(buttonConfirm)
        
        alertView.translatesAutoresizingMaskIntoConstraints = false
        alertView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        alertView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 30).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 10).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -10).isActive = true
        
        buttonYellow.translatesAutoresizingMaskIntoConstraints = false
        buttonYellow.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        buttonYellow.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 50).isActive = true
        buttonYellow.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonYellow.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonWhite.translatesAutoresizingMaskIntoConstraints = false
        buttonWhite.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        buttonWhite.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -50).isActive = true
        buttonWhite.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonWhite.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonConfirm.translatesAutoresizingMaskIntoConstraints = false
        buttonConfirm.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -20).isActive = true
        buttonConfirm.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 50).isActive = true
        buttonConfirm.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -50).isActive = true
        buttonConfirm.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func changeColor(_ sender: UIButton) {
        //guard let vc = presentingViewController as? ViewController else {return}
        
        let backgroundColor = sender.tag == 0 ? UIColor.yellow : UIColor.white
        
        delegate?.colorChange(backgroundColor)
    }
    
    @objc func backFirstView(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else {return}
        
        vc.dismiss(animated: true)
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
