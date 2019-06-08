//
//  ViewController.swift
//  MusicListPractice
//
//  Created by CHANGGUEN YU on 07/06/2019.
//  Copyright © 2019 CHANGGUEN YU. All rights reserved.
//

import UIKit
import Alamofire

class SearchVC: UIViewController {
  
  private let tableView = UITableView()
  
  private var songs: Songs?
  
  private let searchController = UISearchController(searchResultsController: nil)

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configure()
    
    autolayout()
  }
  
  private func configure() {
    tableView.dataSource = self
    view.addSubview(tableView)
    
    searchController.searchBar.delegate = self
    navigationItem.searchController = searchController
    searchController.obscuresBackgroundDuringPresentation = false
  }
  
  private func autolayout() {
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
  }
  
  private func searchApiRequest(_ searchText: String) {
    guard searchText.count != 0 else { return print("searchText is empty")}
    
    guard var comp = URLComponents(string: "https://itunes.apple.com/search") else { return print("can't create URL")}
    
    comp.queryItems = [URLQueryItem.init(name: "media", value: "music"),
                        URLQueryItem.init(name: "entity", value: "song"),
                        URLQueryItem.init(name: "term", value: searchText),
    ]
    
    let req = AF.request(comp)
    
    req
       .validate()
       .responseJSON { (response) in
        switch response.result {
        case .success(let value):
          guard let dictionary = value as? [String: Any],
                let count = dictionary["resultCount"] as? Int,
            let array = dictionary["results"] as? [[String: Any]]
            else {return print("fail")}
          
          var result = Array<Songs.Result>()
          for data in array {
            if let artistName = data["artistName"] as? String,
              let trackName = data["trackName"] as? String,
              let artworkUrl100 = data["artworkUrl100"] as? String,
              let imageUrl = URL(string: artworkUrl100),
              let imageData = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: imageData) {
              
              result.append(Songs.Result(artistName: artistName, trackName: trackName, artworkUrl100: image))
            }
          }
          
          self.songs = Songs(resultCount: count, results: result)
          
          self.tableView.reloadData()
        case .failure(let error):
          print(error.localizedDescription)
        }
  
    }
  }
  
  private func ex(_ search: String) {
//    guard searchText.count != 0 else { return print("searchText is empty")}
    
    guard var comp = URLComponents(string: "https://itunes.apple.com/search") else { return print("can't create URL")}
    
    comp.queryItems = [URLQueryItem.init(name: "media", value: "music"),
                       URLQueryItem.init(name: "entity", value: "song"),
                       URLQueryItem.init(name: "term", value: search),
    ]
    
    guard let url = try? comp.asURL() else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription)}
      guard let response = response as? HTTPURLResponse,
        (200..<300).contains(response.statusCode)
      else { return print("error status")}
      guard let data = data,
        let musicData = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        let count = musicData["resultCount"] as? Int,
        let array = musicData["results"] as? [[String: Any]]
        else { return print("no data")}
      
      var result = Array<Songs.Result>()
      
      for dict in array {
        if let artistName = dict["artistName"] as? String,
        let trackName = dict["trackName"] as? String,
        let artworkUrl100 = dict["artworkUrl100"] as? String,
        let imageUrl = URL(string: artworkUrl100),
        let imageData = try? Data(contentsOf: imageUrl),
        let image = UIImage(data: imageData) {
          
          result.append(Songs.Result(artistName: artistName, trackName: trackName, artworkUrl100: image))
        }
      }
      
      self.songs = Songs(resultCount: count, results: result)
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }.resume()
   
  }

}

extension SearchVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songs?.resultCount ?? 0
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    
    cell.textLabel?.text = songs?.results[indexPath.row].artistName
    cell.detailTextLabel?.text = songs?.results[indexPath.row].trackName
    cell.imageView?.image = songs?.results[indexPath.row].artworkUrl100
    
    return cell
  }
}



extension SearchVC: UISearchBarDelegate {
  func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
    guard let text = searchBar.text else { return false}
//    searchApiRequest(text)
    ex(text)
    return true
  }
}
