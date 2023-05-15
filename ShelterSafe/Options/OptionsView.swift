//
//  OptionsView.swift
//  ShelterSafe
//
//  Created by Onik Hoque on 5/8/23.
//

import Foundation
import SwiftUI


struct OptionsView : View {
    
    var body : some View {
        NavigationStack {
            List() {
                NavigationLink("Create a Shelter") {
                    CreateShelterView()
                }
                NavigationLink("Log In") {
                    HomePageView()
                }
                NavigationLink("View Shelters As List") {
                    ShelterListView()
                }
            }
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
