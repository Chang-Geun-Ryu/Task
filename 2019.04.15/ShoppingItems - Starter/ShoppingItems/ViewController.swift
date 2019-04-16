//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
    let images = ["iPhone8", "iPhoneSE_Gold", "iPhoneSE_RoseGold", "iPhoneX_SpaceGray", "iPhoneX_White"]
    var models:[String] = []
    var salePhones: [Int] = []
    var stockMax: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    for num in 1...15 {
        models.append("i\(num) Phone")
        stockMax.append((3...5).randomElement()!)
        salePhones.append(0)
    }
    
    tableView.register(ItemCell.self, forCellReuseIdentifier: "Custom")
    tableView.rowHeight = 60
    tableView.dataSource = self
    view.addSubview(tableView)
  }
    
    func alert() {
        let alert = UIAlertController(title: "재고수량 초과", message: "준비된 재고이상 주문할수 없습니다.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
}
// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return salePhones.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // cell 을 재사용하여
    let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as! ItemCell
    cell.modelName = models[indexPath.row]
    cell.imageLogo = images[indexPath.row % 5]
    cell.seller = salePhones[indexPath.row]
    cell.stockMax = stockMax[indexPath.row]
    cell.saleCount.text = "\(salePhones[indexPath.row])"
    cell.delegate = self
    
    return cell
  }
}

extension   ViewController: PhoneSellerDelegate {
    func salesPhone(_ cell: ItemCell, _ seller: UILabel, _ sender: UIButton) {
        if let indexPath = tableView.indexPath(for: cell) {
            
            // 한정수량 이상 증가 시키지 못하고 배경색을 red로 바꾼뒤 1초동안 animation으로 white 변화 alert
            guard cell.stockMax >= salePhones[indexPath.row] + 1 else {
                cell.backgroundColor = .red
                UIView.animate(withDuration: 1) {
                    cell.backgroundColor = .white
                }
                self.alert()
                return
            }
            
            // 1씩 증가 후 label에 texting
            salePhones[indexPath.row] += 1
            cell.saleCount.text = "\(salePhones[indexPath.row])"
        }
    }
}
