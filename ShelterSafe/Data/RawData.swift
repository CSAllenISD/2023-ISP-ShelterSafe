//
//  RawData.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 3/15/23.
//

import Foundation
import UIKit
import SwiftUI
import CoreLocation
import CoreLocationUI

//u can make similar functions to "getUsers" for different apis using different model files. this is the controller file

class RawData {
    
    @EnvironmentObject var locationManager : LocationManager
    
    var userLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)" }
    var userLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)" }
    
    
    

    
    
    func getLink() -> String {
        return "https://api.weather.gov/alerts/active?point=\(userLatitude),\(userLongitude)"
    }
    
    
    
    func getUsers(completion:@escaping ([User]) -> ()) {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let users = try! JSONDecoder().decode([User].self, from: data!)
                print(users)
                
                DispatchQueue.main.async {
                    completion(users)
                }
            }
            .resume()
        }
    
  /*  func getAlerts(completion:@escaping ([NWSAlertFeature]) -> ()) {
            guard let url = URL(string: "https://api.weather.gov/alerts/active?area=NY") else { return }
        
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let alert = try! JSONDecoder().decode(NWSAlert.self, from: data!)
                let features = alert.features
        
                
                DispatchQueue.main.async {
                    completion(features)
                }
            }
            .resume()
        } */
    
    func getAlerts(completion:@escaping ([NWSAlert]) -> ()) {
            guard let url = URL(string: "https://api.weather.gov/alerts/active?area=RI") else { return }
        
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let alert = try! JSONDecoder().decode([NWSAlert].self, from: data!)
               // let features = alert.features
        
                
                DispatchQueue.main.async {
                    completion(alert)
                }
            }
            .resume()
        }
    
    
    


}




class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

   
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
}




