//
//  ViewController.swift
//  PinPointLocations
//
//  Created by giftbot on 05/05/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class ViewController: UIViewController {
  
  /***************************************************
   강남역 - 서울특별시 강남구 강남대로 396
   홍대입구역 - 서울특별시 마포구 양화로 160
   명동역 - 서울특별시 중구 퇴계로 126
   대학로 - 서울특별시 종로구 동숭동
   ***************************************************/

  @IBOutlet private weak var mapView: MKMapView!
  var lastPoint: CLLocationCoordinate2D?
  var lastAddress = ""
  var didInputAddress = false
  var count = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
  }
  
  @IBAction private func textFieldDidEndOnExit(_ sender: UITextField) {
    guard let text = sender.text else { return }
    lastAddress = text
    
    let geoCoder = CLGeocoder()
    geoCoder.geocodeAddressString(text) { (placemarks, error) in
      print("\n---------- [ Geocode Address ] ----------\n")
      if let error = error {
        return print(error.localizedDescription)
      }
      guard let placemark = placemarks?.first,
        let coordinate = placemark.location?.coordinate
        else { return }
      
      let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      self.mapView.setRegion(region, animated: true)
      self.didInputAddress = true
    }
  }
}


extension ViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    defer { didInputAddress = false }
    guard didInputAddress else { return }
    
    let center = mapView.centerCoordinate
    addAnnotation(at: center, with: lastAddress)
    addSquareOverlay(at: center)
    
    defer { lastPoint = center }
    guard let startPoint = lastPoint else { return }
    addPolylineOverlay(at: [startPoint, center])
  }
  
  func addAnnotation(at center: CLLocationCoordinate2D, with title: String) {
    count += 1
    let pin = MKPointAnnotation()
    pin.coordinate = center
    pin.title = "\(count)번째 행선지"
    pin.subtitle = title
    mapView.addAnnotation(pin)
  }
  
  func addSquareOverlay(at center: CLLocationCoordinate2D) {
    let squareSize = 0.005
    var point1 = center; point1.latitude += squareSize; point1.longitude -= squareSize
    var point2 = center; point2.latitude += squareSize; point2.longitude += squareSize
    var point3 = center; point3.latitude -= squareSize; point3.longitude += squareSize
    var point4 = center; point4.latitude -= squareSize; point4.longitude -= squareSize
    addPolylineOverlay(at: [point1, point2, point3, point4, point1])
  }
  
  func addPolylineOverlay(at points: [CLLocationCoordinate2D]) {
    let polyline = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyline)
  }
  
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    let polyline = overlay as! MKPolyline
    let renderer = MKPolylineRenderer(polyline: polyline)
    renderer.lineWidth = 1
    renderer.strokeColor = .red
    renderer.alpha = 0.8
    return renderer
  }
}


