
import Foundation

//
//  CreateShelterView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/20/23.
//


import SwiftUI

struct CreateShelterView: View {
    
    
    
    @State private var name = ""
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    @State private var description = ""
    @State private var foodAvailability = ""
    @State private var populationCapacity = ""
    @State private var maxCapacity = 0
    @State private var shelterArray = [Shelter]()
    
    @State private var showingSuccessAlert = false
    @State private var showingFailureAlert = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.zeroSymbol = ""
        return formatter
    }()
    
    

    //@State private var shelter: Shelter?
    
    
    
    var body: some View {
        
        VStack {
            
            Text("Create A New Shelter")
            
            
            Form {
                TextField("Name", text: $name)
                    .tint(Color(red: 0.83, green: 0.71, blue: 0.71))
                
                TextField("Brief Description", text: $description)
                    .tint(Color(red: 0.83, green: 0.71, blue: 0.71))
                
                TextField("Latitude", value: $latitude, formatter: formatter)
                    .tint(Color(red: 0.83, green: 0.71, blue: 0.71))
                
                TextField("Longitude", value: $longitude, formatter: formatter)
                    .tint(Color(red: 0.83, green: 0.71, blue: 0.71))
                
                TextField("Max Capacity", value: $maxCapacity, formatter: formatter)
                    .tint(Color(red: 0.83, green: 0.71, blue: 0.71))
                
                Picker("Food Availability", selection: $foodAvailability) {
                    Text("Surplus")
                    Text("Abundant")
                    Text("Moderate")
                    Text("Shortage")
                }
                
                Picker("Population Capacity", selection: $populationCapacity) {
                    Text("Overfilled")
                    Text("Filled")
                    Text("Moderate")
                    Text("Near Empty")
                }
                
                
                
                
                
                
                
                
            }
            
            Button("Create Shelter") {
                
                if (name != "" && latitude != 0.0 && longitude != 0.0 && description != "" && foodAvailability != "" && populationCapacity != "" && maxCapacity != 0) {
                    
                }
                

            }
                
                
                
            
            .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
            
            
        }
        
    }
}
    
    func getNextID() -> Int {
        var currentShelterArray = [Shelter]()
        RawData.getShelters { fetchedShelters in currentShelterArray = fetchedShelters
        }
        
        if let lastShelter = currentShelterArray.last {
            return lastShelter.id
        } else {
            return 0
        }
    }
    


struct CreateShelterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShelterView()
        
    }
}
