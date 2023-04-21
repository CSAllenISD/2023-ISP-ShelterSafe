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
    
   
    @State var shelters : [Shelter] = []
    
    
 
    
    
 
    
    var body: some View {
        VStack {
            Text("Disaster Details")
            NavigationView {
                List {
                    ForEach(shelters, id: \.id) { shelter in
                        NavigationLink(destination: Text("test")) { Text(shelter.name)
                    }
                }
            }

                }
            .onAppear {
                    RawData.getShelters() { fetchedUsers in
                        self.shelters = fetchedUsers
                    }

        }
        }
        
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

