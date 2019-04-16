//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol PhoneSellerDelegate: class {
    func salesPhone(_ cell: ItemCell, _ seller: UILabel, _ sender: UIButton)
}


final class ItemCell: UITableViewCell {
    
    var imageLogo: String = ""
    var modelName: String = ""
    var stockMax: Int = 0
    var seller: Int = 0
    
    weak var delegate: PhoneSellerDelegate?
    let saleCount = UILabel()
    let phoneImage = UIImageView()
    let label = UILabel()
    let button = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        phoneImage.image = UIImage(named: imageLogo)
        contentView.addSubview(phoneImage)
        label.text = modelName
        print(modelName)
        label.textAlignment = .left
        contentView.addSubview(label)
        
        button.setImage(UIImage(named: "add"), for: .normal)
        button.addTarget(self, action: #selector(sale), for: .touchUpInside)
        contentView.addSubview(button)
        
        contentView.addSubview(saleCount)
        
        
        // Auto layout
        phoneImage.translatesAutoresizingMaskIntoConstraints = false
        phoneImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        phoneImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        phoneImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        phoneImage.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: phoneImage.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: phoneImage.bottomAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: saleCount.leadingAnchor, constant: -10).isActive = true
        
        saleCount.translatesAutoresizingMaskIntoConstraints = false
        saleCount.leadingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        saleCount.topAnchor.constraint(equalTo: phoneImage.topAnchor).isActive = true
        saleCount.bottomAnchor.constraint(equalTo: phoneImage.bottomAnchor).isActive = true
        saleCount.trailingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        saleCount.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: saleCount.trailingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: phoneImage.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: phoneImage.bottomAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    @objc func sale(_ sender: UIButton){
        // 버튼 클릭시 TableView에 작업을 대리하여 시킴
        delegate?.salesPhone(self, saleCount, sender)
    }
}
