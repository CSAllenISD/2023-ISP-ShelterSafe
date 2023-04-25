//
//  CreateShelterView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/20/23.
//

import SwiftUI
import Firebase

struct CreateShelterView: View {
    struct Shelter {
        var name: String
        var phoneNumber: String
        var latitude: Double
        var longitude: Double
        var address: String
        var city: String
        var state: String
    }
    
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    @State private var address = ""
    @State private var city = ""
    @State private var state = ""
    @State private var shelter: Shelter?
    @State private var shelterCreated = false
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Phone Number", text: $phoneNumber)
            TextField("Latitude", value: $latitude, formatter: NumberFormatter())
            TextField("Longitude", value: $longitude, formatter: NumberFormatter())
            TextField("Address", text: $address)
            TextField("City", text: $city)
            TextField("State", text: $state)
            
            Button(action: createShelter) {
                Text("Create Shelter")
            }
            
            if shelterCreated {
                Text("Shelter Name: \(shelter!.name)")
                Text("Shelter's Phone Number: \(shelter!.phoneNumber)")
                Text("Shelter's coordinates: X: \(shelter!.latitude), Y: \(shelter!.longitude)")
                Text("Shelter's Location: \(shelter!.address), \(shelter!.city), \(shelter!.state)")
            }
        }
    }
    
    private func createShelter() {
        let newShelter = Shelter(
            name: name,
            phoneNumber: phoneNumber,
            latitude: latitude,
            longitude: longitude,
            address: address,
            city: city,
            state: state
        )
        
        shelter = newShelter
        shelterCreated = true
    }

    
}

struct CreateShelterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShelterView()
        
    }
}

