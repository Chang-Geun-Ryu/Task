//
//  ViewController.swift
//  SingletonExample
//
//  Created by CHANGGUEN YU on 08/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static let value = ViewController()
    
    var redColor: Float?
    var greenColor: Float?
    var blueColor: Float?
    
    var redSlider: UISlider?
    var greenSlider: UISlider?
    var blueSlider: UISlider?

    override func viewDidLoad() {
        super.viewDidLoad()
        let uiWidth = view.frame.width - 30
        // Do any additional setup after loading the view.
        redSlider =  UISlider(frame: CGRect(x: 15, y: 100, width: uiWidth, height: 100))
        redSlider?.maximumValue = 255
        redSlider?.minimumValue = 0
        redSlider?.tag = 0
        redSlider?.addTarget(self, action: #selector(getValue), for: .touchUpInside)
        view.addSubview(redSlider!)
        
        greenSlider = UISlider(frame: CGRect(x: 15, y: 200, width: uiWidth, height: 100))
        greenSlider?.maximumValue = 255
        greenSlider?.minimumValue = 0
        greenSlider?.tag = 1
        greenSlider?.addTarget(self, action: #selector(getValue), for: .touchUpInside)
        view.addSubview(greenSlider!)
        
        blueSlider = UISlider(frame: CGRect(x: 15, y: 300, width: uiWidth, height: 100))
        blueSlider?.maximumValue = 255
        blueSlider?.minimumValue = 0
        blueSlider?.tag = 2
        blueSlider?.addTarget(self, action: #selector(getValue), for: .touchUpInside)
        view.addSubview(blueSlider!)
        
        let redView = UIView(frame: CGRect(x: 15, y: 70, width: uiWidth, height: 50))
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        let greenView = UIView(frame: CGRect(x: 15, y: 170, width: uiWidth, height: 50))
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        let blueView = UIView(frame: CGRect(x: 15, y: 270, width: uiWidth, height: 50))
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        let redLabel = UILabel(frame: CGRect(x: Int(redView.bounds.origin.x + 10), y: Int(redView.bounds.origin.y + 5), width: 50, height: 40))
        redLabel.text = "red"
        redView.addSubview(redLabel)
        
        let greenLabel = UILabel(frame: CGRect(x: Int(greenView.bounds.origin.x + 10), y: Int(greenView.bounds.origin.y + 5), width: 50, height: 40))
        greenLabel.text = "green"
        greenView.addSubview(greenLabel)
        
        let blueLabel = UILabel(frame: CGRect(x: Int(blueView.bounds.origin.x + 10), y: Int(blueView.bounds.origin.y + 5), width: 50, height: 40))
        blueLabel.text = "blue"
        blueView.addSubview(blueLabel)
        
        let button = UIButton(type: .system)
        button.frame = CGRect(x: view.frame.width/2 - 50, y: view.frame.height/2, width: 100, height: 50)
        button.setTitle("Set", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(goSecondView(_:)), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc func goSecondView(_ sender: UIButton) {
        let second = SecondViewController()
        present(second, animated: true)
    }
    
    @objc func getValue(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            ViewController.value.redColor = sender.value
        case 1:
            ViewController.value.greenColor = sender.value
        case 2:
            ViewController.value.blueColor = sender.value
        default:
            break
        }
    }
    
    
}

