//
//  MapBoxMapView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 11/29/22.
//

import SwiftUI
import MapboxCommon
import MapboxMaps
import MapboxCoreMaps
import CoreLocation

struct MapBoxMapView: UIViewControllerRepresentable {
     
    func makeUIViewController(context: Context) -> ViewController {
           return ViewController()
       }
      
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

class ViewController: UIViewController, CLLocationManagerDelegate {
   private var mapView: MapView!
   override public func viewDidLoad() {
       super.viewDidLoad()
       
       
       let locationManager = CLLocationManager()
       
       // For use in foreground
       //self.locationManager.requestWhenInUseAuthorization()
       locationManager.requestWhenInUseAuthorization()

       if CLLocationManager.locationServicesEnabled() {
           locationManager.delegate = self
           locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
           locationManager.startUpdatingLocation()
       }
       
       let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoib25pa2giLCJhIjoiY2xiMWtyNG5kMDR1bTN3b2Z6NGtmbm92bSJ9.jktBy9muy0FjQvjshVeORg")
       
       //let myCameraOptions = CameraOptions(center: locationManager.location?.coordinate, zoom: 16, pitch: 45)
       let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
       
       //let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: myCameraOptions)
       
       
       mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
       
       mapView.location.delegate = self
       mapView.location.options.puckType = .puck2D()
       
       
       
       
       
       
       mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       self.view.addSubview(mapView)
      // var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 33.123806, longitude: -96.67585))
       mapView.mapboxMap.onNext(event: .mapLoaded) { _ in
           
           self.mapView.camera.fly(to: CameraOptions(center: locationManager.location?.coordinate, zoom: 16, pitch: 45), duration: 2.0)
       }
   }
    
    
    func requestPermissionsButtonTapped() {
            mapView.location.requestTemporaryFullAccuracyPermissions(withPurposeKey: "CustomKey")
        }
    
    
}


extension ViewController: LocationPermissionsDelegate {
    
    func locationManager(_ locationManager: LocationManager, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        if accuracyAuthorization == .reducedAccuracy {
            // Perform an action in response to the new change in accuracy
        }
    }
    
    
}



