//
//  SettingsView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/24/23.
//


import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                List {
                    NavigationLink(destination: CreateShelterView()) {
                        Text("Create A New Shelter")
                    }
                    
                    Text("Place Holder")
                    Text(" ")
                    Text("Place Holder")
                    Text(" ")
                    Text("Place Holder")
                    Text(" ")
                    Text("Place Holder")
                    Text(" ")
                    Text("Place Holder")
                }
            }
            .navigationTitle("Settings")

        }
        
    }
}



struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}



