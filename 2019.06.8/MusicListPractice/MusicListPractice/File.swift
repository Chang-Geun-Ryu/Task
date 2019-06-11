//
//  File.swift
//  MusicListPractice
//
//  Created by CHANGGUEN YU on 07/06/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
//import Foundation

struct Songs: Decodable {
  let resultCount: Int
  let results: [Result]
  
  struct Result: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: UIImage
    
    enum CodingKeys: String, CodingKey {
      case artistName
      case trackName
      case artworkUrl100
    }
    
    init(artistName: String, trackName: String, artworkUrl100: UIImage) {
      self.artistName = artistName
      self.trackName = trackName
      self.artworkUrl100 = artworkUrl100
    }
    
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      artistName = try values.decode(String.self, forKey: .artistName)
      trackName = try values.decode(String.self, forKey: .trackName)
      
      let imageURL = try values.decode(String.self, forKey: .artworkUrl100)
      artworkUrl100 = try UIImage(data: Data(contentsOf: URL(string: imageURL)!))!
    }
  }
}


