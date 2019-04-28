//
//  DetailViewController.swift
//  DominoPizzaExam
//
//  Created by Kira on 24/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
  weak var menu: MenuInfo?
  var imageName: String = ""
  var category = ""
  
  let imageView = UIImageView()
  let minusButton = UIButton(type: .system)
  let plusButton = UIButton(type: .system)
  let buyLabel = UILabel()
  let grayView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    grayView.backgroundColor = .darkGray
    view.addSubview(grayView)
    
    imageView.image = UIImage(named: title ?? "") // 타이틀이 메뉴 이름이므로 이미지 로드
    view.addSubview(imageView)
    
    minusButton.addTarget(self, action: #selector(pushButton(_:)), for: .touchUpInside)
    minusButton.setTitle("-", for: .normal)
    minusButton.setTitleColor(.black, for: .normal)
    minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    minusButton.backgroundColor = .white
    grayView.addSubview(minusButton)
    
    plusButton.addTarget(self, action: #selector(pushButton(_:)), for: .touchUpInside)
    plusButton.setTitle("+", for: .normal)
    plusButton.backgroundColor = .white
    plusButton.setTitleColor(.black, for: .normal)
    plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    grayView.addSubview(plusButton)
    
    buyLabel.backgroundColor = .darkGray
    buyLabel.font = UIFont.systemFont(ofSize: 30)
    buyLabel.textColor = .white
    buyLabel.textAlignment = .center
    buyLabel.text = "\(menu?.getQauntity() ?? 0)"
    grayView.addSubview(buyLabel)
    
    autoLayout()
  }
  
  func autoLayout() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    
    grayView.translatesAutoresizingMaskIntoConstraints = false
    grayView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    grayView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100).isActive = true
    grayView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7).isActive = true
    grayView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1).isActive = true
    
    minusButton.translatesAutoresizingMaskIntoConstraints = false
    minusButton.leadingAnchor.constraint(equalTo: grayView.leadingAnchor, constant: 5).isActive = true
    minusButton.centerYAnchor.constraint(equalTo: grayView.centerYAnchor).isActive = true
    minusButton.widthAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
    minusButton.heightAnchor.constraint(equalTo: grayView.heightAnchor, constant: -10).isActive = true
    
    plusButton.translatesAutoresizingMaskIntoConstraints = false
    plusButton.trailingAnchor.constraint(equalTo: grayView.trailingAnchor, constant: -5).isActive = true
    plusButton.centerYAnchor.constraint(equalTo: grayView.centerYAnchor).isActive = true
    plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor).isActive = true
    plusButton.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
    
    buyLabel.translatesAutoresizingMaskIntoConstraints = false
    buyLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor).isActive = true
    buyLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor).isActive = true
    buyLabel.topAnchor.constraint(equalTo: grayView.topAnchor).isActive = true
    buyLabel.bottomAnchor.constraint(equalTo: grayView.bottomAnchor).isActive = true
  }
  
  @objc func pushButton(_ sender: UIButton) {
    switch sender {
    case minusButton: // (-) Button touch 메뉴 인스턴스에 접근하여 수량 -1
      menu?.minus()
    default:          // (+) Button touch 메뉴 인스턴스에 접근하여 수량 +1
      menu?.plus()
    }
    showBuyLabel()    // 수량 변경 label 표시
  }
  
  func showBuyLabel() {
    buyLabel.text = "\(menu?.getQauntity() ?? 0) 개"
  }
}
