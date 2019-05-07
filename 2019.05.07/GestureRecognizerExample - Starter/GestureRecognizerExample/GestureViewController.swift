//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.cornerRadius = imageView.frame.width / 2
    imageView.clipsToBounds = true
  }
  
  var isQuadruple = false
  @IBAction func handleTapGesture(_ sender: UITapGestureRecognizer){
    print("Double Tapped")
    if isQuadruple {
      imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
    } else {
      imageView.transform = CGAffineTransform.identity
    }
    isQuadruple.toggle()
  }
  
  @IBAction func handleRotationGesture (_ sender: UIRotationGestureRecognizer) {
    let rotation = sender.rotation
    imageView.transform = imageView.transform.rotated(by: rotation)
    sender.rotation = 0
//    imageView.transform = CGAffineTransform.identity.rotated(by: rotation)
  }
  
  @IBAction func handleSwipeGesure(_ sender: UISwipeGestureRecognizer) {
    print("a")
    let direction = sender.direction
    switch direction {
    case .right:
      imageView.image = UIImage(named: "cat1")
    case .left:
      imageView.image = UIImage(named: "cat2")
    default:
      break
    }
  }
}
