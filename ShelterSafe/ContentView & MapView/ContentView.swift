//
//  ContentView.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 11/15/22.
//

import SwiftUI
import MapboxMaps
import MapboxCoreMaps



struct ContentView: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            VStack{
                MapBoxMapView()
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
                }.tint(Color.yellow)
                
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

