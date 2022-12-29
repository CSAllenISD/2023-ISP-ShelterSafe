//
//  ShelterSafeApp.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 11/15/22.
//

import SwiftUI

@main
struct ShelterSafeApp: App {
    let persistenceController = PersistenceController.shared
    @State private var MapOpen = true
    @State private var InfoOpen = false
    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
