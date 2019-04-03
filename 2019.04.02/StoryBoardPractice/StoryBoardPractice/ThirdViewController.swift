//
//  ThirdViewController.swift
//  StoryBoardPractice
//
//  Created by CHANGGUEN YU on 03/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var segmentString = "First"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChaned(_ sender: UISegmentedControl) {
        segmentString = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? ""
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
