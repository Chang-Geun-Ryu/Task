//
//  MainTableViewController.swift
//  SearchViewControllerExample
//
//  Created by Wi on 11/05/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
  
  var filteredPizzas = [Product]()
  
  let searchController = UISearchController(searchResultsController: nil)
  
  func void() {
    print("void")
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Pizza Search"
    
    // Setup Basic SearchController Setting
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    navigationItem.searchController = searchController
    
    // Setup other SearchController Setting
    searchController.searchBar.placeholder = "Search Dominos"
    
    searchController.obscuresBackgroundDuringPresentation = false
    
    filteredPizzas = menuData.map { $0.menu }.flatMap { $0 }
    
    searchController.searchBar.scopeButtonTitles =
      ["All"] + menuData.map { print($0.category); return $0.category }
    
    let aavoid: () -> () = void
    
    aavoid()
    
    
//    menuData.map(<#T##transform: (MenuData) throws -> T##(MenuData) throws -> T#>)
    
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return filteredPizzas.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

    cell.textLabel?.text = filteredPizzas[indexPath.row].name
    cell.detailTextLabel?.text = "\(filteredPizzas[indexPath.row].price)"
    
    return cell
  }
  
  
  // MARK: - For Search method

  func filterContentForSearchText(_ searchText: String, scope: String = "All") {
    
    filteredPizzas = menuData.filter { (scope == "All") || ($0.category == scope) } .map { $0.menu } .flatMap { $0 } .filter { searchBarIsEmpty() ? true : $0.name.contains(searchText) }
    
    tableView.reloadData()
  }
  
  // MARK: - searchBar의 text의 유무를 반환하고 만약 nil 이라면 ture 반환
  func searchBarIsEmpty() -> Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }
}

extension MainTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!, scope: scope)
  }
}

extension MainTableViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
  }
}

