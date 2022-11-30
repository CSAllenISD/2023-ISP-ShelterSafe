//
//  ContentView.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 11/15/22.
//

import SwiftUI
import UIKit
import MapboxMaps
import MapboxCoreMaps

var CurrentScreen = ContentView()

struct ContentView: View {
    var toggle2details = false
    var body: some View {
        
        ZStack {
            MapBoxMapView()
            VStack {
                Text("ShelterSafe")
                    .padding(.top, 3.0)
                Spacer()
                HStack {
                    
                    Spacer()
                    
                    Text("Button1")
                    
                    Spacer()
                    
                    Text("Button2")
                    
                    Spacer()
                    
                    Button("Disaster Details") {
                        
                    }
                    
                    Spacer()
                } // Vstack bracket
            } // Hstack bracket
        } // Zstack bracket
        
    } // var body bracket
} //ContentView bracket

struct DetailsView: View {
    var body: some View {
    
    Text("test")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentScreen
    }
}
