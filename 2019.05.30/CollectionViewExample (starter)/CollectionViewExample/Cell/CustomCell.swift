//
//  CustomCell.swift
//  CollectionViewExample
//
//  Created by giftbot on 29/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
  static let identifier = "CustomCell"
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  private func setupViews() {
    
    clipsToBounds = true  // 자신보다 큰 자식 view가 있을 경우 자신의 영역 밖으로 못나가도록 함
    
    layer.cornerRadius = 20
    
    // imageView
    
    imageView.contentMode = .scaleAspectFill
    contentView.addSubview(imageView)
    
    // titleLabel
    titleLabel.textAlignment = .center
    titleLabel.textColor = .white
    titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
    contentView.addSubview(titleLabel)
  }
  
  private func setupConstraints() {
    [imageView, titleLabel].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      titleLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
      ])
    
    titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
  }
  
  func configure(image: UIImage?, title: String) {
    imageView.image = image
    titleLabel.text = title
  }
}
