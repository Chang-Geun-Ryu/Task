//
//  ViewController.swift
//  StoryBoardPractice
//
//  Created by CHANGGUEN YU on 02/04/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit

// ActionSegue -> ShouldPerformSegue -> Prepare
// ManualSegue -> Should(X) -> PerformSegue -> Prepare

class ViewController: UIViewController {
    @IBOutlet weak var ThirdSelectedLabel: UILabel!
    
    enum Animal: String {
        case Dog,Cat,Bird
    }
    var animalsDict: [String:Int] = [
        Animal.Dog.rawValue:0,
        Animal.Cat.rawValue:0,
        Animal.Bird.rawValue:0
    ]
    
    var showAnimalName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard var count = animalsDict[identifier] else { return false}
        
        count += 1
        animalsDict[identifier] = count
        
        switch identifier {
        case "Dog":
            return 8 >= count
        case "Cat":
            return 10 >= count
        case "Bird":
            return 15 >= count
        default:
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.imageName = segue.identifier ?? ""
    }
    
    @IBAction func unwindToFirstView(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        if let secondVC = sourceViewController as? SecondViewController,
            let counted = animalsDict[secondVC.imageName] {
            
            animalsDict[secondVC.imageName] = counted + secondVC.plusCounting
            
        } else if let thirdVC = sourceViewController as?  ThirdViewController {
            
            ThirdSelectedLabel.text = thirdVC.segmentString
        }
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
        
    }
    
    @IBAction func showThird(_ sender: UIButton) {
        performSegue(withIdentifier: "Third", sender: sender)
    }
}

