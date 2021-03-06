//
//  FrameExtensions.swift
//  WeatherForecast
//
//  Created by giftbot on 13/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

extension CGRect {
  static var screenBounds: CGRect { return UIScreen.main.bounds }
  
  static func make(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
  }
}

extension CGFloat {
  public static let screenWidth = UIScreen.main.nativeBounds.size.width  / UIScreen.main.nativeScale
  public static let screenHeight = UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale
}

extension UIView {
  var x: CGFloat {
    get { return frame.origin.x }
    set { frame.origin.x = newValue }
  }
  var y: CGFloat {
    get { return frame.origin.y }
    set { frame.origin.y = newValue }
  }
    var width: CGFloat {
    get { return frame.width }
    set { frame.size.width = newValue }
  }
  var height: CGFloat {
    get { return frame.height }
    set { frame.size.height = newValue }
  }
  var origin: CGPoint {
    get { return frame.origin }
    set { frame.origin = newValue }
  }
  var size: CGSize {
    get { return frame.size }
    set { frame.size = newValue }
  }
  var maxX: CGFloat {
    return frame.origin.x + frame.size.width
  }
  var maxY: CGFloat {
    return frame.origin.y + frame.size.height
  }
}
