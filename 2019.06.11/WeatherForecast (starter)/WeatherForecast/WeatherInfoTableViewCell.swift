//
//  WeatherInfoTableViewCell.swift
//  WeatherForecast
//
//  Created by CHANGGUEN YU on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class WeatherInfoTableViewCell: UITableViewCell {
  @IBOutlet weak var temperature: UILabel!
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var skyImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
