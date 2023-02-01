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

struct MapBoxMapView: UIViewControllerRepresentable {
     
    func makeUIViewController(context: Context) -> ViewController {
           return ViewController()
       }
      
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

class ViewController: UIViewController {
   internal var mapView: MapView!
   override public func viewDidLoad() {
       super.viewDidLoad()
       
       
       
       let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoib25pa2giLCJhIjoiY2xiMWtyNG5kMDR1bTN3b2Z6NGtmbm92bSJ9.jktBy9muy0FjQvjshVeORg")
       //let myCameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 33.123806, longitude: -96.67585), zoom: 16, pitch: 30)
       //let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: myCameraOptions)
       
       let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
       
       
       mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
       
       mapView.location.delegate = self
       mapView.location.options.puckType = .puck2D()
       
       
       
       
       mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       self.view.addSubview(mapView)
      // var pointAnnotation = PointAnnotation(coordinate: CLLocationCoordinate2D(latitude: 33.123806, longitude: -96.67585))
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



