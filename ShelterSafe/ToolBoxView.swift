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
            List(alerts, id: \.id) { alert in
                Text(alert.properties.headline)
                
            }
            .onAppear {
                RawData().getAlerts(url: "https://api.weather.gov/alerts/active?point=\(latitude),\(longitude)") { fetchedUsers in
                    self.alerts = fetchedUsers
                }
        }
        }
        
    }
    
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBoxView().environmentObject(LocationManager())
    }
}
