//
//  MapBoxMapView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 11/29/22.
//


import SwiftUI
import UIKit
import MapboxCommon
import MapboxMaps
import MapboxCoreMaps
import CoreLocation




struct MapBoxMapView: UIViewControllerRepresentable {
    
     
    func makeUIViewController(context: Context) -> MapViewController {
           return MapViewController()
       }
      
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        
    }
}

class MapViewController: UIViewController, CLLocationManagerDelegate, LocationPermissionsDelegate {
   internal var mapView: MapView!
   override public func viewDidLoad() {
       super.viewDidLoad()
       let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoib25pa2giLCJhIjoiY2xiMWtyNG5kMDR1bTN3b2Z6NGtmbm92bSJ9.jktBy9muy0FjQvjshVeORg")
       let myCameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 33.1003966, longitude: -96.6586053), zoom: 16, pitch: 45)
       let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: myCameraOptions)
       mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
       mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       self.view.addSubview(mapView)
       
       mapView.location.delegate = self
       mapView.location.options.activityType = .other
       mapView.location.options.puckType = .puck2D()
       mapView.location.locationProvider.startUpdatingLocation()


       
      // var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 33.123806, longitude: -96.67585))
           }
       
   }

extension MapViewController {
    func locationUpdate(newLocation: CLLocation) {
        mapView.camera.fly(to: CameraOptions(center: newLocation.coordinate, zoom: 16), duration: 5.0)
        print(newLocation.coordinate)
    }
}

    /*func locationUpdate() {
        mapView.camera.fly(to: CameraOptions(center: CLLocationCoordinate2D(latitude: 33.123806, longitude: -96.67585), zoom: 16), duration: 5.0)
    }*/
    


