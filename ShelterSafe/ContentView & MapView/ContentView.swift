//
//  ContentView.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 11/15/22.
//
import SwiftUI
import CoreLocationUI
import MapKit

import SwiftUI
import UIKit
//import MapboxMaps
//import MapboxCoreMaps
import MapKit



struct ContentView: View {
    @State private var selectedTab = "One"
    @State private var viewModel = ContentViewModel()
    
    
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            VStack{
               Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                    .onAppear{
                        viewModel.checkIfLocationServicesEnabled()
                    }
                //MapBoxMapView()
            }
                .tabItem {
                    Label("One", systemImage: "map")
                }.tag("One")
            
            Text("Toolbox")
                .tabItem {
                    Label("Two", systemImage: "gear")
                }
                .tag("Two")
            
            
            
           
            DetailView().ignoresSafeArea()
                .tabItem {
                    Label("Three", systemImage: "tornado")
                }
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

final class ContentViewModel:NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.123806, longitude: -96.67585), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var locationManger: CLLocationManager?
    
    func checkIfLocationServicesEnabled() {
        DispatchQueue.main.async { [self] in
            if CLLocationManager.locationServicesEnabled() {
                self.locationManger = CLLocationManager()
                locationManger!.delegate = self
            } else {
                print("Show alert that location services is off.")
            }
        }
    }
    private func checkLocationAuthorization() {
        guard let locationManger = locationManger else { return }
        
        switch locationManger.authorizationStatus {
            
        case .notDetermined:
            locationManger.requestWhenInUseAuthorization()
        case .restricted:
            print("Location is restricted.")
        case .denied:
            print("Location has been denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManger.location!.coordinate,span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

