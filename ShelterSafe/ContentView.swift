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
                        Label("Map", systemImage: "map")
                    }.tag("Map")
                
            HomePageView()
                .tabItem {
                    Label("Home Page", systemImage: "house")
                }
                .tag("Home Page")
            
                ToolBoxView()
                    .tabItem {
                        Label("Weather Watch", systemImage: "tornado")
                    }
                    .tag("WeatherWatch")
                
                
                //DetailView().ignoresSafeArea()
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }.tint(Color.yellow)
                
                
            }
                
        }
        
    }

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                
        }
    }
