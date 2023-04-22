//
//  ShelterListView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 4/11/23.
//

import Foundation
import SwiftUI


//this is the view file

struct ShelterListView: View {
    
    @State private var numberOfShelters : Int = 0
    @State private var shelterName : String = ""
    @State private var latitude : Double? = nil
    @State private var longitude : Double? = nil
    
    @State private var shelterDescription : String = ""
    @State private var foodAvailability : String = ""
    @State private var populationCapacity : String = ""
    
    //replace this with auto id getter thing
    
    
    
 
    
    var body: some View {
        VStack {
         Text("Create A Shelter")
            List {
                TextField("Shelter Name", text: $shelterName).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Shelter Description", text: $shelterName).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Latitude", value: $latitude, formatter: NumberFormatter())
                TextField("Longitude", value: $longitude, formatter: NumberFormatter())
                Picker("Food Availability", selection: $foodAvailability) {
                    Text("Abundant").tag("Abundant")
                    Text("Moderate").tag("Moderate")
                    Text("Shortage").tag("Shortage")
                }
                Picker("Population Capacity", selection: $populationCapacity) {
                    Text("Overfilled").tag("Overfilled")
                    Text("Near Full").tag("Near Full")
                    Text("Moderately Filled").tag("Moderately Filled")
                    Text("Near Empty").tag("Near Empty")
                }
            }
            Spacer()
            Button("Create Shelter") {
                RawData.getShelters { fetchedShelters in
                    self.numberOfShelters = fetchedShelters.count
                }
                
                let id = self.numberOfShelters + 1
                let shelter = Shelter(id: id, name: shelterName, latitude: latitude ?? 0, longitude: longitude ?? 0)
                
                RawData.addShelter(shelter: shelter)
                
            }
        }.padding()
 
        
    }
    
}

//struct DisasterDetailView : View {
  //  let details : String
  //  let
    
  //  var body : some View {
    //    Text("test")
   // }
//}

struct ShelterList_Previews: PreviewProvider {
    static var previews: some View {
        ShelterListView()
    }
}

