//
//  ViewController.swift
//  SandboxDirectoryExample
//
//  Created by giftbot on 15/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet private weak var tableView: UITableView!
  let fileManager = FileManager.default
  let bundle = Bundle.main
  
  var chartYears: [String] = []
  var songsChart: [String: [String: [String]]] = [:] {
    didSet {
      chartYears = songsChart["Melon"]?.keys.sorted() ?? []
      tableView.reloadData()
    }
  }
  
  
  // MARK: - [ Print directory ]
  
  @IBAction private func printBundleDirectory(_ sender: UIButton) {
    print("\n---------- [ BundlePath ] ----------")
    print(bundle.bundlePath)
    
    print("\n---------- [ Bundle InfoDictionary ] ----------")
    let info = bundle.infoDictionary!
    print("Bundle infoDictionary : \(info)\n")
    
    print("CFBundleIdentifier :", info["CFBundleIdentifier"]!)
    print("UIMainStoryboardFile :", info["UIMainStoryboardFile"]!)
    print("MinimumOSVersion :", info["MinimumOSVersion"]!)
  }
  
  @IBAction private func printDocumentsDirectory(_ sender: UIButton) {
    print("\n---------- [ DocumentsPath ] ----------")
    let documentsUrl = fileManager.urls(
      for: .documentDirectory,
      in: .userDomainMask
      ).first!
    print(documentsUrl.path)
    
    if let contents = try? fileManager.contentsOfDirectory(
      at: documentsUrl, includingPropertiesForKeys: [], options: [.skipsHiddenFiles]
      ) {
      print(contents)
    }
  }
  
  @IBAction private func printApplicationSupportDirectory(_ sender: UIButton) {
    print("\n---------- [ ApplicationSupportPath ] ----------")
    let appSupportUrl = FileManager.default.urls(
      for: .applicationSupportDirectory,
      in: .userDomainMask
      ).first!
    print(appSupportUrl.path)
    
    print("\n---------- [ ApplicationSupport Contents ] ----------")
    if let contents = try? fileManager.contentsOfDirectory(
      at: appSupportUrl, includingPropertiesForKeys: [], options: [.skipsHiddenFiles]
      ) {
      contents.forEach { print($0.lastPathComponent) }
    }
    
    print("\n---------- [ ApplicationSupport Nested Dir Contents ] ----------")
  }
  
  @IBAction private func printCachesDirectory(_ sender: UIButton) {
    print("\n---------- [ printCachesPath ] ----------")
    let cachesUrl = FileManager.default.urls(
      for: .cachesDirectory,
      in: .userDomainMask
      ).first!
    print(cachesUrl.path)
    
    if let contents = try? fileManager.contentsOfDirectory(
      at: cachesUrl, includingPropertiesForKeys: [], options: [.skipsHiddenFiles]
      ) {
      print(contents)
    }
  }
  @IBAction private func printTemporaryDirectory(_ sender: UIButton) {
    print("\n---------- [ TemporaryPath ] ----------")
    let tmpUrl = fileManager.temporaryDirectory
    print(tmpUrl.path)

    if let contents = try? fileManager.contentsOfDirectory(
      at: tmpUrl, includingPropertiesForKeys: [], options: [.skipsHiddenFiles]
      ) {
      print(contents)
    }
  }
  
  
  
  // MARK: - [ File Handling ]
  
  @IBAction private func bundleFile(_ sender: UIButton) {
    print("\n---------- [ SongsChart in BundleContainer ] ----------")
    guard let filePath = bundle.path(forResource: "SongsChart", ofType: "plist"),
      let fileData = fileManager.contents(atPath: filePath),
      let songsChart = try? PropertyListSerialization.propertyList(from: fileData, format: nil) as? [String: Any],
      let melonChart = songsChart["Melon"] as? [String: [String]]
      else { return }
    
    self.songsChart = ["Melon": melonChart]
    
    melonChart
      .sorted { $0.0 < $1.0 }  // 키값 기준 오름차순
      .forEach { (key, value) in
        print("\n[ \(key) 멜론 Top 10 ]")
        value.forEach { print(">", $0)}
    }
  }
  
  
  @IBAction private func updateFileData(_ sender: Any) {
    print("\n---------- [ Update FileData ] ----------")
    
    guard let filePath = bundle.path(forResource: "SongsChart", ofType: "plist"),
      let fileData = fileManager.contents(atPath: filePath),
      var songsChart = try? PropertyListSerialization.propertyList(from: fileData, format: nil) as? [String: [String: [String]]]
      else { return }
    
    songsChart["Melon"]?["2016년"] = [
      "TWICE (트와이스) - CHEER UP",
      "여자친구 (GFRIEND) - 시간을 달려서 (Rough)",
      "엠씨더맥스 - 어디에도",
      "어반자카파 - 널 사랑하지 않아",
      "다비치 - 이 사람",
      "한동근 - 이 소설의 끝을 다시 써보려 해",
      "지코 (ZICO) - 너는 나 나는 너",
      "거미 - You Are My Everything",
      "TWICE (트와이스) - OOH-AHH하게",
      "이적 - 걱정말아요 그대"
    ]
    
    self.songsChart = songsChart
  }
  
  private func saveFileUrl() -> URL {
    let appSupportDir = fileManager.urls(
      for: .applicationSupportDirectory,
      in: .userDomainMask
    ).first!
    let bundleIdentifier = bundle.infoDictionary!["CFBundleIdentifier"] as! String
    let saveDir = appSupportDir
      .appendingPathComponent(bundleIdentifier, isDirectory: true)
    
    if !fileManager.fileExists(atPath: saveDir.path) {
      try? fileManager.createDirectory(
        at: saveDir,
        withIntermediateDirectories: true,
        attributes: nil
      )
    }
    
    let fileUrl = saveDir
      .appendingPathComponent("SongsChart")
      .appendingPathExtension("plist")
    
     return fileUrl
  }
  
  
  @IBAction private func saveFile(_ sender: UIButton) {
    print("\n---------- [ Save File to ApplicationSupport ] ----------")
    let fileUrl = saveFileUrl()
    do {
      try (songsChart as NSDictionary).write(to: fileUrl)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  @IBAction private func loadFile(_ sender: UIButton) {
    print("\n---------- [ Load File from ApplicationSupport ] ----------")
    let fileUrl = saveFileUrl()
    guard fileManager.fileExists(atPath: fileUrl.path) else {
      return print("File doesn't exist")
    }
    guard let songsChart = NSDictionary(contentsOf: fileUrl) as? [String: Any],
      let melonChart = songsChart["Melon"] as? [String: [String]]
      else { return }
    
    melonChart
      .sorted { $0.0 < $1.0 }
      .forEach { (key, value) in
        print("\n[ \(key) 멜론 Top 10 ]")
        value.forEach { print(">", $0) }
    }
    
    self.songsChart = ["Melon": melonChart]
  }
}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return chartYears.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let melon = songsChart["Melon"] else { return 0 }
    return melon[chartYears[section]]?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    if let melon = songsChart["Melon"],
      let song = melon[chartYears[indexPath.section]]?[indexPath.row] {
      let splitArr = song.split(separator: "-", maxSplits: 1)
      
      cell.textLabel?.text = String(splitArr.last?.dropFirst() ?? "")
      cell.detailTextLabel?.text = String(splitArr.first ?? "")
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return chartYears[section]
  }
}


