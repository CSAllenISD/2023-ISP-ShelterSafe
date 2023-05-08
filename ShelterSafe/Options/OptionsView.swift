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
                    OptionsView()
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
