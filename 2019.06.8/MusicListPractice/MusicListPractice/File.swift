//
//  File.swift
//  MusicListPractice
//
//  Created by CHANGGUEN YU on 07/06/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit


struct Songs {
  let resultCount: Int
  let results: [Result]
  
  struct Result {
    let artistName: String
    let trackName: String
    let artworkUrl100: UIImage // imageURL
  }
}
