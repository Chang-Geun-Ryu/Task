//
//  SecondViewController.swift
//  StoryBoardPractice
//
//  Created by CHANGGUEN YU on 02/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView!
    
    var imageName = ""
    var plusCounting = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animalImageView.image = UIImage(named: imageName)
        
    }
    
    @IBAction func plusCount(_ sender: UIButton) {
        plusCounting += 1
        print(plusCounting)
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
