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
    @State var alerts : [NWSAlert] = []
    @State var users : [User] = []
    
    var userLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)" }
    var userLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)" }
    
    var body: some View {
         List(users, id: \.id) { alert in
             Text(alert.name)
             
         }
         .onAppear {
             RawData().getUsers { fetchedUsers in
                 print(fetchedUsers.description)
                 self.users = fetchedUsers
             }
         }
     }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(LocationManager())
    }
}

