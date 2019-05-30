//
//  BasicStoryboardViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class BasicStoryboardViewController: UIViewController {

  @IBOutlet private weak var collectionView: UICollectionView!
  
  let parkImages = ParkManager.imageNames(of: .nationalPark)
  
  
}

extension BasicStoryboardViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCell", for: indexPath)
    
    if let imageView = cell.contentView.subviews.first as? UIImageView {
      let imageName = parkImages[indexPath.item % parkImages.count]
      imageView.image = UIImage(named: imageName)
      cell.layer.cornerRadius = cell.frame.width / 2
    }
    
    return cell
  }
}
