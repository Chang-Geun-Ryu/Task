//
//  ViewController.swift
//  MapViewPractice
//
//  Created by CHANGGUEN YU on 10/05/2019.
//  Copyright © 2019 유창근. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

  let mapView = MKMapView()
  let textView = UIView()
  let textField = UITextField()
  
  var destination: [MKPointAnnotation] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    view.addSubview(mapView)
    textView.backgroundColor = .clear
    mapView.addSubview(textView)
    textField.textAlignment = .left
    textField.font = UIFont.systemFont(ofSize: 20)
    textField.borderStyle = .roundedRect
    textField.delegate = self
    textView.addSubview(textField)
    
    autolayout()
    setRegiontoSeoul()
  }
  
  func autolayout() {
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.topAnchor.constraint(equalTo: mapView.topAnchor).isActive = true
    textView.leadingAnchor.constraint(equalTo: mapView.leadingAnchor).isActive = true
    textView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor).isActive = true
    textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.topAnchor.constraint(equalTo: textView.topAnchor, constant: 5).isActive = true
    textField.leadingAnchor.constraint(equalTo: textView.leadingAnchor, constant: 10).isActive = true
    textField.trailingAnchor.constraint(equalTo: textView.trailingAnchor,constant: -10).isActive = true
    textField.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: -5).isActive = true
  }
  
  func setRegiontoSeoul() {
    let center = CLLocationCoordinate2DMake(37.5514, 126.9880)
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
    let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    mapView.setRegion(region, animated: true)
  }
  
  func getCoordnate(addr: String,  completion: @escaping (CLLocation?) ->()) {
    guard !addr.isEmpty else { return }
    let locatoin = CLLocation(latitude: 37.5514, longitude: 126.9880)
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(locatoin) { (placeMark, error) in
      if error != nil {
        return print(error!.localizedDescription)
      }
      
      geocoder.geocodeAddressString(addr, completionHandler: { (placeMark, error) in
        guard let placeMark = placeMark?.first else { return }
        completion(placeMark.location)
      })
    }
  }
  
  func makeDestinationLine() {
    guard destination.count > 1 else { return }
    
    var points: [CLLocationCoordinate2D] = []
    for idx in (destination.count - 2)..<destination.count {
      points.append(destination[idx].coordinate)
    }
    
    let polyLine = MKPolyline(coordinates: points, count: points.count)
    mapView.addOverlay(polyLine)
  }
  
  func makeDestinationRect(location: CLLocationCoordinate2D) {
    var leftUp = location;      leftUp.latitude -= 0.001;     leftUp.longitude -= 0.001
    var leftDown = location;    leftDown.latitude -= 0.001;   leftDown.longitude += 0.001
    var rightUp = location;     rightUp.latitude += 0.001;    rightUp.longitude -= 0.001
    var rightDown = location;   rightDown.latitude += 0.001;  rightDown.longitude += 0.001
    
    let points: [CLLocationCoordinate2D] = [leftUp, leftDown, rightDown, rightUp, leftUp,]
    let polygon = MKPolygon(coordinates: points, count: points.count)
    mapView.addOverlay(polygon)
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    textField.becomeFirstResponder()
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    getCoordnate(addr: textField.text ?? "") {//print("print",$0)
      let addDestination = MKPointAnnotation()
      addDestination.coordinate = $0!.coordinate
      addDestination.title = "\(self.destination.count + 1)번째 행선지"
      self.destination.append(addDestination)
      self.mapView.addAnnotation(addDestination)
      self.setRegion(coordinate: $0!.coordinate)
      self.makeDestinationRect(location: $0!.coordinate)
      self.makeDestinationLine()
    }
    return true
  }
}

extension ViewController: MKMapViewDelegate {
  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    if let polyline = overlay as? MKPolyline {
      let renderer = MKPolylineRenderer(polyline: polyline)
      renderer.strokeColor = .blue
      renderer.lineWidth = 2
      return renderer
    }
    if let rectgon = overlay as? MKPolygon {
      let renderer = MKPolygonRenderer(polygon: rectgon)
      renderer.strokeColor = .red
      renderer.lineWidth = 2
      return renderer
    }
    return MKOverlayRenderer(overlay: overlay)
  }
}
