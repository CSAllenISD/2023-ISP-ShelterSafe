//
//  ToolBoxView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 12/28/22.
//

import Foundation
import SwiftUI


//this is the view file

struct ToolBoxView: View {
    
    @EnvironmentObject var locationManager : LocationManager
    @State var alerts : [NWSAlertFeature] = []
    
    
    
    var userLatitude: String { return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)" }
    var userLongitude: String { return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)" }
    
    let latitude = "39"
    let longitude = "-90"
    
    var body: some View {
        VStack {
            Text("Disaster Details")
            NavigationView {
                List {
                    ForEach(alerts, id: \.id) { alert in
                        NavigationLink(destination: Text(alert.properties.headline)) { Text(alert.properties.event)
                    }
                }
            }

                }
            .onAppear {
                    RawData.getAlerts(url: "https://api.weather.gov/alerts/active?point=\(userLatitude),\(userLongitude)") { fetchedUsers in
                        self.alerts = fetchedUsers
                    }

        }
        }
        
    }
    
}

struct DisasterDetailView : View {
    let details : String
  //  let
    
    var body : some View {
        Text("test")
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBoxView().environmentObject(LocationManager())
    }
}
