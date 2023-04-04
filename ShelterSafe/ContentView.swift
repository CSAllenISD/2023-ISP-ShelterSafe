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
                
                MapBoxMapView().edgesIgnoringSafeArea(.top)
            }
                .tabItem {
                    Label("Map", systemImage: "map")
               }.tag("Map")

            //DetailView().ignoresSafeArea()
            Text("placeholder")
                .tabItem {
                    Label("Weather Watch", systemImage: "tornado")
                }.tint(Color.yellow)
            
            HomePageView()
                .tabItem {
                    Label("Home Page", systemImage: "house")
                }
                .tag("Home Page")
            
            VStack{
                
                
                MapBoxMapView().edgesIgnoringSafeArea(.top)
                
            }
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }.tag("Map")
                
                ToolBoxView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag("Settings")
                
                
                //DetailView().ignoresSafeArea()
                Text("placeholder")
                    .tabItem {
                        Label("Weather Watch", systemImage: "tornado")
                    }.tint(Color.yellow)
                
                
            }
                
        }
        
    }

    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

