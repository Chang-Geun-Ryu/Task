//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 02/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private var touchingPoint = CGPoint(x: 0, y: 0)
  private var touching = false
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.layer.cornerRadius = imageView.frame.width / 2
    //imageView.layer.masksToBounds = true  // layer영역 벗어나지 못하도록 설정
    imageView.clipsToBounds = true        // layer영역 벗어나지 못하도록 설정
  }
  
  func imageChange(touching: Bool, touchPosition: CGPoint) {
    guard self.touching != touching else { return }
    guard imageView.frame.contains(touchPosition) else { return }
    
    if touching {
      imageView.image = UIImage(named: "cat2")
      self.touching = touching
      touchingPoint.x = imageView.center.x - touchPosition.x
      touchingPoint.y = imageView.center.y - touchPosition.y
    } else {
      imageView.image = UIImage(named: "cat1")
      self.touching = touching
    }
  }
  
  func moveImage(_ touchPosition: CGPoint) {
    guard imageView.frame.contains(touchPosition) else { return }
    
    imageView.center.x = touchPosition.x + touchingPoint.x
    imageView.center.y = touchPosition.y + touchingPoint.y
  }
  
  //
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    imageChange(touching: true, touchPosition: touchPoint)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    moveImage(touchPoint)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    imageChange(touching: false, touchPosition: touchPoint)
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
  }
}
