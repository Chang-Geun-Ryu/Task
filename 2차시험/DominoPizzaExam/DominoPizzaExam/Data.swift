//
//  Data.swift
//  DominoPizzaExam
//
//  Created by CHANGGUEN YU on 26/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import Foundation

/***********************************************************
 메뉴 정보 입력 및
 **********************************************************/
final class PizzaList {
  let cateforyTitles = ["슈퍼시드", "프리미엄", "클래식", "음료", "사이드디시", "피클소스"]

  private let sideMenu = ["딸기 슈크림","슈퍼곡물 치킨","애플 크러스트 디저트","치킨퐁듀 그라탕","퀴노아 치킨 샐러드","포테이토 순살치킨"]
  private let superSeed = ["글램핑 바비큐","알로하 하와이안","우리 고구마","콰트로 치즈 퐁듀"]
  private let drinks = ["미닛메이드 스파클링 청포도","스프라이트","코카콜라 제로","코카콜라"]
  private let classic = ["베이컨체더치즈","불고기","슈퍼디럭스","슈퍼슈프림","페퍼로니","포테이토"]
  private let primenum = ["더블크러스트 이베리코","블랙앵거스 스테이크","블랙타이거 슈림프","와규 앤 비스테카","직화 스테이크"]
  private let pickleSauce = ["갈릭 디핑 소스","스위트 칠리소스","우리 피클 L","우리 피클 M","핫소스"]
  
  var menus: [String: [MenuInfo]] = [:]
  var aa: [[String]] = []
  init() {
    var manuMaker: [MenuInfo] = []
    
    
    
    sideMenu.forEach { manuMaker.append( MenuInfo(menuName: $0, menuPrice: 7000) ) }
    menus.updateValue(manuMaker, forKey: "사이드디시")
    manuMaker.removeAll()
    
    superSeed.forEach { manuMaker.append(MenuInfo(menuName: $0, menuPrice: 10000)) }
    menus.updateValue(manuMaker, forKey: "슈퍼시드")
    manuMaker.removeAll()
    
    drinks.forEach { manuMaker.append(MenuInfo(menuName: $0, menuPrice: 3000))}
    menus.updateValue(manuMaker, forKey: "음료")
    manuMaker.removeAll()
    
    classic.forEach { manuMaker.append(MenuInfo(menuName: $0, menuPrice: 10000)) }
    menus.updateValue(manuMaker, forKey: "클래식")
    manuMaker.removeAll()
    
    primenum.forEach { manuMaker.append(MenuInfo(menuName: $0, menuPrice: 10000)) }
    menus.updateValue(manuMaker, forKey: "프리미엄")
    manuMaker.removeAll()
    
    pickleSauce.forEach { manuMaker.append(MenuInfo(menuName: $0, menuPrice: 500)) }
    menus.updateValue(manuMaker, forKey: "피클소스")
  }
}

/***********************************************************
 메뉴 정보 저장 및 주문수량 관리 클래스
 **********************************************************/
final class MenuInfo {
  let menuName: String
  let menuPrice: Int
  private var orderQuantity: Int = 0
  
  init(menuName: String, menuPrice: Int) {
    self.menuName = menuName
    self.menuPrice = menuPrice
  }
  
  func minus() {
    guard orderQuantity > 0 else { return }
    orderQuantity -= 1
    print(orderQuantity)
  }
  func plus() {
    orderQuantity += 1
  }
  
  func getQauntity() -> Int {
    return orderQuantity
  }
  
  func setZeroOrderQuantity() {
    orderQuantity = 0
  }
}
