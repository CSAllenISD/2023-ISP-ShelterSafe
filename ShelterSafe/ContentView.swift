//
//  ContentView.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 11/15/22.
//
import SwiftUI
//import MapboxMaps
//import MapboxCoreMaps


struct ContentView: View {
    @State private var selectedTab = "One"
    @EnvironmentObject var locationsViewModel: LocationsViewModel

    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            
            
            VStack{
                
                
                LocationsView().edgesIgnoringSafeArea(.top)
                    .environmentObject(LocationsViewModel())
                
            }
                    .tabItem {
                        Label("Map", image: "map")
                    }.tag("Map")
                
                AlertsView()
                    .tabItem {
                        Label("Weather Watch", image: "newTornado")
                    }
                    .tag("Settings")
                
                
                //DetailView().ignoresSafeArea()
               OptionsView()
                    .tabItem {
                        Label("Options", image: "newGears")
                    }.tint(Color.blue)
                
                
        }.onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
                
        }
        
    }

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                
        }
    }
