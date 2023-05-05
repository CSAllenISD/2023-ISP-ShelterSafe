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
    
    
    
    static func getUsers(completion:@escaping ([User]) -> ()) {
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
    
    static func getAlerts(url: String, completion:@escaping ([NWSAlertFeature]) -> ()) {
            guard let url = URL(string: url) else { return }
        
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let alert = try! JSONDecoder().decode(NWSAlert.self, from: data!)
                let features = alert.features
        
                
                DispatchQueue.main.async {
                    completion(features)
                }
            }
            .resume()
        }
    
    
    static func getShelters( completion:@escaping ([Shelter]) -> ()) {
            guard let url = URL(string: "https://www.codermerlin.academy/igis/onik-hoque/get_shelters") else { return }
        
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let shelters = try! JSONDecoder().decode([Shelter].self, from: data!)
                
                DispatchQueue.main.async {
                    completion(shelters)
                }
            }
            .resume()
        }
    
    
    static func addShelter(shelter: Shelter) async {
        let url = URL(string: "https://codermerlin.academy/igis/onik-hoque/add_shelters")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            let encoder = JSONEncoder()
            do {
                let jsonData = try encoder.encode(shelter)
                request.httpBody = jsonData
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let session = URLSession.shared
                session.dataTask(with: request) { data, response, error in
                    if let data = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            print(json)
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
            } catch {
                print(error)
            }
        }
        
    
    
    
    
    static func editShelter(shelter: Shelter) {
        
        guard let url = URL(string: "https://codermerlin.academy/igis/onik_hoque/edit_shelters") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONEncoder().encode(shelter) else { return }
        
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with:request) { shelter, response, error in
            //pass
        }.resume()
    
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
    
    func distanceBetweenCoordinates(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
        let earthRadius = 3958.8
        let lat1Radians = lat1 * Double.pi / 180.0
        let lon1Radians = lon1 * Double.pi / 180.0
        let lat2Radians = lat2 * Double.pi / 180.0
        let lon2Radians = lon2 * Double.pi / 180.0
        let dLat = lat2Radians - lat1Radians
        let dLon = lon2Radians - lon1Radians
        let a = sin(dLat / 2.0) * sin(dLat / 2.0) + cos(lat1Radians) * cos(lat2Radians) * sin(dLon / 2.0) * sin(dLon / 2.0)
        let c = 2.0 * atan2(sqrt(a), sqrt(1.0 - a))
        let distance = earthRadius * c
        return distance
    }

}




