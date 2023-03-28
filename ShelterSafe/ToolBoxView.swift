//
//  ToolBoxView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 12/28/22.
//

import Foundation
import SwiftUI
import CoreLocation

//this is the view file

struct ToolBoxView : View {
    
    @State var users : [User] = []
    
    var body : some View {
        Text("hi")
            .onAppear() {
                RawData().getUsers { (users) in
                    self.users = users
                    for user in users {
                        print(user.name)
                    }
                }
            }.padding()
    }

}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var locationStatus : CLAuthorizationStatus?
    @Published var lastLocation : CLLocation?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    var statusString : String {
        guard let status = locationStatus else {
            return "unknown"
        }
        //WORK HERE!!!!!!!!!!!!!!!!
        switch status {
            case
        }
        
        
        
    }

}

