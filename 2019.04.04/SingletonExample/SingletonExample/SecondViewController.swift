//
//  SecondViewController.swift
//  SingletonExample
//
//  Created by CHANGGUEN YU on 08/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: CGFloat(ViewController.value.redColor ?? 0)/255, green: CGFloat(ViewController.value.greenColor ?? 0)/255, blue: CGFloat(ViewController.value.blueColor ?? 0)/255, alpha: 0.5)
        
        let dismissButton = UIButton(type: .system)
        dismissButton.frame = CGRect(x: view.frame.width/2 - 50, y: view.frame.height/2, width: 100, height: 50)
        dismissButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.addTarget(self, action: #selector(getBack(_:)), for: .touchUpInside)
        dismissButton.setTitle("back", for: .normal)
        view.addSubview(dismissButton)
    }
    
    @objc func getBack(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else { return }
        
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
