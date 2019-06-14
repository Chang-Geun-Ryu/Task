//
//  WeatherCasterView.swift
//  WeatherForecast
//
//  Created by giftbot on 14/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class WeatherCasterView: UIView {
  
  private enum UI {
    static let xMargin: CGFloat = 20
    static let topInfoViewHeight: CGFloat = 45
    static let locationLabelHeight: CGFloat = 23
    static let reloadbuttonSize: CGFloat = 40
    static let currentForecastHeight: CGFloat = 200
  }
  
  // MARK: - Properties
  
  // MARK: Private
  private let imageView = UIImageView(frame: .screenBounds).then {
    $0.image = UIImage(named: "sunny")
    $0.contentMode = .scaleAspectFill
  }
  private let blurView = UIVisualEffectView(frame: .screenBounds).then {
    $0.effect = UIBlurEffect(style: .dark)
  }
  
  private let topInfoView = UIView()
  private let locationLabel = UILabel().then {
    $0.textColor = .white
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .headline)
  }
  private let timeLabel = UILabel().then {
    $0.textColor = .white
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .subheadline)
  }
  
  // MARK: Internal
  
  let reloadButton = UIButton(type: .system).then {
    $0.setTitle("↻", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .preferredFont(forTextStyle: .title1)
    $0.alpha = 0
  }
  let tableView = UITableView().then {
    $0.separatorStyle = .none
    $0.backgroundColor = .clear
    $0.allowsSelection = false
    $0.showsVerticalScrollIndicator = false
  }
  
  
  // MARK: - Initializing
  
  init() {
    super.init(frame: .screenBounds)
    
    self.addSubviews(imageView, blurView, topInfoView, tableView)
    topInfoView.addSubviews(locationLabel, timeLabel, reloadButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Layout Views

  // safeAreaInsets 값은 필요하고, layoutSubviews에서의 반복 적용은 피하고 싶을 때 고려
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    topInfoView.frame = CGRect.make(
      UI.xMargin, 0,
      width - (UI.xMargin * 2), safeAreaInsets.top + UI.topInfoViewHeight
    )
    locationLabel.frame = CGRect.make(
      0, safeAreaInsets.top,
      topInfoView.width, UI.locationLabelHeight
    )
    timeLabel.frame = CGRect.make(
      0, locationLabel.frame.maxY,
      topInfoView.width, UI.topInfoViewHeight - UI.locationLabelHeight
    )
    reloadButton.frame = CGRect.make(
      topInfoView.width - UI.reloadbuttonSize, 0,
      UI.reloadbuttonSize, UI.reloadbuttonSize
    )
    reloadButton.center.y = (UI.topInfoViewHeight / 2) + safeAreaInsets.top
    
    tableView.frame = CGRect.make(
      0, topInfoView.frame.maxY, width, height - topInfoView.frame.maxY
    )
    let topInset = tableView.height - UI.currentForecastHeight
      - (safeAreaInsets.bottom / 2)
    tableView.contentInset.top = topInset
  }
  
  
  // MARK: - Manipulate View
  
  func updateBackgroundImage(imageName: String) {
    UIView.transition(
      with: imageView, duration: 1,
      options: [.transitionCrossDissolve],
      animations: {
        self.imageView.image = UIImage(named: imageName)
    })
  }
  
  func updateBlurView(alpha: CGFloat) {
    blurView.alpha = alpha
  }
  
  func applyParallaxEffect(translationX: CGFloat) {
    imageView.transform = CGAffineTransform(translationX: translationX, y: 0)
  }
  
  func updateTopInfoView(location: String, time: String) {
    locationLabel.text = location
    timeLabel.text = time
    
    locationLabel.alpha = 0
    timeLabel.alpha = 0
    reloadButton.alpha = 0
    UIView.animate(withDuration: 0.4) {
      self.locationLabel.alpha = 1
      self.timeLabel.alpha = 1
      self.reloadButton.alpha = 1
    }
  }
}
