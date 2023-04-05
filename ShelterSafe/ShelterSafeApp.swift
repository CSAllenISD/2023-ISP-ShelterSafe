//
//  ShelterSafeApp.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 11/15/22.
//

import SwiftUI
import FirebaseCore

@main
struct ShelterSafeApp: App {
    let persistenceController = PersistenceController.shared
    @State private var MapOpen = true
    @State private var InfoOpen = false
    
    init() {
        FirebaseApp.configure()
    }
    

    var body: some Scene {
        WindowGroup {
            var locationManager = LocationManager()
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(locationManager)
        }
    }
}
