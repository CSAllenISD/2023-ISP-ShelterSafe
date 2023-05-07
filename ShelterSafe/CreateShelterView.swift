
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
    @State private var foodAvailability = "Surplus"
    @State private var populationCapacity = "Overfilled"
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
                    Text("Surplus").tag("Surplus")
                    Text("Abundant").tag("Abundant")
                    Text("Moderate").tag("Moderate")
                    Text("Shortage").tag("Shortage")
                    //Text(String())
                }
                
                Picker("Population Capacity", selection: $populationCapacity) {
                    Text("Overfilled").tag("Overfilled")
                    Text("Filled").tag("Filled")
                    Text("Moderate").tag("Moderate")
                    Text("Near Empty").tag("Near Empty")
                }
                
                
                
                
                
                
                
                
            }
            
            Button("Create Shelter") {
                
                if (name != "" && description != "" && latitude != 0.0) {
                    
                    var idToReturn = 0
                    
                    getLastShelterID { id in
                        idToReturn = id ?? 0
                    }
                    let shelterToAdd = Shelter(id: idToReturn, name: name, latitude: latitude, longitude: longitude, description: description, foodAvailability: foodAvailability, populationCapacity: populationCapacity, maxCapacity: maxCapacity)
                    Task {
                        await RawData.addShelter(shelter: shelterToAdd)
                    }
                    
                    showingSuccessAlert = true
                    
                } else {
                    showingFailureAlert = true
                }
                

            }.alert(isPresented: $showingFailureAlert, content: {
                Alert(title: Text("Please make sure all fields are filled out before attempting to create a shelter."))
            })
                
                
                
            
            .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
            
            
        }
        
    }
}
    
func getLastShelterID(completion: @escaping (Int?) -> Void) {
    RawData.getShelters { shelters in
        guard let lastShelter = shelters.last else {
            completion(0)
            return
        }
        completion(lastShelter.id)
    }
}

    


struct CreateShelterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShelterView()
        
    }
}
