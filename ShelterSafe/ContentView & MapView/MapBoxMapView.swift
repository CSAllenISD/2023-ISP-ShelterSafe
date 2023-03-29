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
       let coordinate = CLLocationCoordinate2DMake(32.7767, -96.7970)
       var pointAnnotation = PointAnnotation(coordinate: coordinate)
               pointAnnotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
       mapView.mapboxMap.onNext(event: .mapLoaded) { _ in
           
           self.mapView.camera.fly(to: CameraOptions(center: locationManager.location?.coordinate, zoom: 16, pitch: 45), duration: 2.0)
           
       
       
       // Make the annotation show a red pin
           pointAnnotation.iconAnchor = .bottom
           
           // Create the `PointAnnotationManager` which will be responsible for handling this annotation
           let pointAnnotationManager = self.mapView.annotations.makePointAnnotationManager()

           // Add the annotation to the manager in order to render it on the map.
           pointAnnotationManager.annotations = [pointAnnotation]
       }
   }
    
    
    func requestPermissionsButtonTapped() {
            mapView.location.requestTemporaryFullAccuracyPermissions(withPurposeKey: "CustomKey")
        }
    
    
}
extension ViewController: AnnotationInteractionDelegate {
    public func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
        print("Annotations tapped: \(annotations)")
    }
}

extension ViewController: LocationPermissionsDelegate {
    
    func locationManager(_ locationManager: LocationManager, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        if accuracyAuthorization == .reducedAccuracy {
            // Perform an action in response to the new change in accuracy
        }
    }
    
    
}



