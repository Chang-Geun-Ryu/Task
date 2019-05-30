//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class CustomCellViewController: UIViewController {
  
  var collectionView: UICollectionView!
  
  let numberArr = Array(1...120)
  let parkImages = ParkManager.imageNames(of: .nationalPark)
  var showImage = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupNavigationItem()
  }

  private func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    setupFlowLayout()
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = .white
    
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    
    view.addSubview(collectionView)
  }
  
  private func setupFlowLayout() {
    let layout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
    
    if showImage {
      // image
      layout.itemSize = CGSize(width: 120, height: 120)
      layout.minimumInteritemSpacing = 15 // 기본값
      layout.minimumLineSpacing = 15
      layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    } else {
      // ColorCircle
      layout.itemSize = CGSize(width: 60, height: 60)
      layout.minimumInteritemSpacing = 10 // 기본값
      layout.minimumLineSpacing = 20
      layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
  }
  
  private func setupNavigationItem() {
    let changeItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(changeCollectionViewItems(_:)))
    let changeDirection = UIBarButtonItem(barButtonSystemItem: .reply, target: self, action: #selector(changeCollectionViewDirection(_:)))
    
    navigationItem.rightBarButtonItems = [changeItem, changeDirection]
  }
  
  @objc private func changeCollectionViewItems(_ sender: Any) {
    showImage.toggle()
    setupFlowLayout()
    collectionView.reloadData()
  }
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let layout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
    let current = layout.scrollDirection
    layout.scrollDirection = current == .horizontal ? .vertical : .horizontal
  }
  
}

// MARK: - UICollectionViewDataSource

extension CustomCellViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return showImage ? parkImages.count * 2 : numberArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
    let cell: UICollectionViewCell!
    if showImage {
      let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
      let item = indexPath.item % parkImages.count
      
      customCell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
      cell = customCell
    } else {
      cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
      cell.layer.cornerRadius = cell.frame.width / 2
      
    }
    
    cell.backgroundColor = getColor(at: indexPath)
    
    
    return cell
  }
  
  func getColor(at indexPath: IndexPath) -> UIColor {
    let maxCount = showImage ? parkImages.count * 2 : numberArr.count           // 0 ~ numberArr.count
    let item = CGFloat(indexPath.item)
    let factor =  0.1 + item / CGFloat(maxCount) * 0.8  // 0 ~ 1 ,최소 0.1 ~ 최대 0.9
    
    if showImage {
      return .init(hue: factor, saturation: 1, brightness: 1, alpha: 1)
    } else {
      return .init(hue: factor, saturation: factor, brightness: 1, alpha: 1)
    }
  }
}

extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    
    if indexPath.item % 5 == 2 {
      return layout.itemSize.applying(CGAffineTransform(scaleX: 2, y: 2))
      
    } else {
      return layout.itemSize
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.alpha = 0
    cell.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
    UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
      cell.alpha = 1
      cell.transform = .identity
    }, completion: nil)
  }
}
