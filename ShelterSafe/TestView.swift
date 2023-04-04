//
//  TestView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 3/29/23.
//
import Foundation
import SwiftUI


//this is the view file
struct TestView: View {
    
    @EnvironmentObject var locationManager : LocationManager
    @State var users : [User] = []
    @State var shelters : [Shelter] = []
    
    var userLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)" }
    var userLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)" }
    
    var body: some View {
         List(shelters, id: \.id) { alert in
             Text(alert.name)
             
         }
         .onAppear {
             RawData.getShelters { fetchedShelters in
                 self.shelters = fetchedShelters
             }
         }
     }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(LocationManager())
    }
}
