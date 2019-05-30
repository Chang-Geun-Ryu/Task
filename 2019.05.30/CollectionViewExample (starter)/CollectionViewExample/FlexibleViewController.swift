//
//  FlexibleViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 30/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class FlexibleViewController: UIViewController {
  
  private enum UI {
    static let itemsInLine: CGFloat = 3
    static let linesOnScreen: CGFloat = 4
    static let itemSpacing: CGFloat = 10.0
    static let lineSpacing: CGFloat = 10.0
    static let edgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    
    static let nextOffset: CGFloat = 0
    
    // 1. linesOnScreen 속성 적용
    // 도전 과제
    // 1. nextOffset
  }
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: view.frame,
                                             collectionViewLayout: layout)
  var parkImages = ParkManager.imageNames(of: .nationalPark)
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
  }
  
  // MARK: Setup CollectionView
  
  func setupCollectionView() {
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    view.addSubview(collectionView)
    
//    setupFlowLayout()
  }
  
  // 재일 처음 view.safeAreaInsets 값이 정해지는 함수
  override func viewSafeAreaInsetsDidChange() {
    super.viewSafeAreaInsetsDidChange()
    setupFlowLayout()
  }
  
  //
  override func viewWillLayoutSubviews() {
//    <#code#>
  }
  
  // MARK: Setup FlowLayout
  func setupFlowLayout() {
    layout.minimumInteritemSpacing = UI.itemSpacing
    layout.minimumLineSpacing = UI.lineSpacing
    layout.sectionInset = UI.edgeInsets
    
    let itemSpacing = UI.itemSpacing * (UI.itemsInLine - 1)
    let horizontalInset = UI.edgeInsets.left + UI.edgeInsets.right
    let verticalInset = UI.edgeInsets.top + UI.edgeInsets.bottom + view.safeAreaInsets.top + view.safeAreaInsets.bottom
    
    if layout.scrollDirection == .vertical {
      let horizontalSpacing = itemSpacing + horizontalInset
      let verticalSpacing = itemSpacing + verticalInset
      
      let width = ((collectionView.frame.width - horizontalSpacing) / UI.itemsInLine)
      let height = ((collectionView.frame.height - verticalSpacing ) / UI.linesOnScreen) - (UI.nextOffset) / UI.linesOnScreen
      
      let roundedWidth = width.rounded(.down)
      let roundedHeight = height.rounded(.down)
      print("vertical: \(height)")
      layout.itemSize = CGSize(width: roundedWidth, height: roundedHeight)
      
    } else {
      let horizontalSpacing = itemSpacing + horizontalInset
      let verticalSpacing = itemSpacing + verticalInset
      
      let width = ((collectionView.frame.width - horizontalSpacing) / UI.linesOnScreen) - (UI.nextOffset) / UI.linesOnScreen
      let height = ((collectionView.frame.height - verticalSpacing) / UI.itemsInLine)
      
      let roundedHeight = height.rounded(.down)
      let roundedWidth = width.rounded(.down)
      print("horizontal")
      layout.itemSize = CGSize(width: roundedWidth, height: roundedHeight)
    }
  }
  
  // MARK: Setup NavigationItem
  
  func setupNavigationItem() {
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply,
      target: self,
      action: #selector(changeCollectionViewDirection(_:))
    )
    
    navigationItem.rightBarButtonItems = [changeDirection]
  }
  
  // MARK: - Action Handler
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = layout.scrollDirection
    layout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
    setupFlowLayout()
  }
  
}

// MARK: - UICollectionViewDataSource

extension FlexibleViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CustomCell.identifier,
      for: indexPath
      ) as! CustomCell
    
    let item = indexPath.item % parkImages.count
    cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
    cell.backgroundColor = .black
    
    return cell
  }
}



