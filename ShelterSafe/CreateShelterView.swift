//
//  CreateShelterView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/20/23.
//

import SwiftUI
import CoreData

struct CreateShelterView: View {
    
    struct Shelter {
        var name: String
        var phoneNumber: String
        var coordinates: (latitude: Double, longitude: Double)
        var county: String
        var address: String
        var city: String
        var state: String
    }
    
    var body: some View {
        Text("Create Shelter View")
    }
    
    func createShelter() -> UIViewController {
        
        // Create an alert controller to display input fields to the user
        let alertController = UIAlertController(title: "Create Shelter", message: nil, preferredStyle: .alert)
        
        // Add text fields for each property of the Shelter struct
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Phone number"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "County"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Address"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "City"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "State"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Latitude"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Longitude"
        }
        
        // Create a "Save" action that creates a new Shelter object with the user input and saves it to Core Data
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            guard let name = alertController.textFields?[0].text,
                  let phoneNumber = alertController.textFields?[1].text,
                  let county = alertController.textFields?[2].text,
                  let address = alertController.textFields?[3].text,
                  let city = alertController.textFields?[4].text,
                  let state = alertController.textFields?[5].text,
                  let latitudeText = alertController.textFields?[6].text,
                  let longitudeText = alertController.textFields?[7].text,
                  let latitude = Double(latitudeText),
                  let longitude = Double(longitudeText)
            else {
                return
            }
            
            
            let coordinates = (latitude: latitude, longitude: longitude)
            
            // Create a new instance of the Shelter object
            let shelter = Shelter(name: name, phoneNumber: phoneNumber, coordinates: coordinates, county: county, address: address, city: city, state: state)
            
            
            // Get a reference to the Core Data container
            guard let shelterSafeApp = UIApplication.shared.delegate as? 
                ShelterSafeApp else {
                return
            }
            let managedContext = shelterSafeApp.persistenceController.container.viewContext
            
            
            // Create a new Core Data entity for the Shelter object
            let entity = NSEntityDescription.entity(forEntityName: "ShelterEntity", in: managedContext)!
            let shelterEntity = NSManagedObject(entity: entity, insertInto: managedContext)
            
            // Set the values of the ShelterEntity's properties to match the Shelter object
            shelterEntity.setValue(name, forKeyPath: "name")
            shelterEntity.setValue(phoneNumber, forKeyPath: "phoneNumber")
            shelterEntity.setValue(county, forKeyPath: "county")
            shelterEntity.setValue(address, forKeyPath: "address")
            shelterEntity.setValue(city, forKeyPath: "city")
            shelterEntity.setValue(state, forKeyPath: "state")
            shelterEntity.setValue(latitude, forKeyPath: "latitude")
            shelterEntity.setValue(longitude, forKeyPath: "longitude")
            
            // Save the changes to Core Data
            do {
                try managedContext.save()
                print("Saved shelter to Core Data.")
            } catch  let as NSError {
            }
                
        }
    }
}

struct CreateShelterView_Previews: PreviewProvider {
    static var previews: some View {
        CreateShelterView()
        
    }
}
