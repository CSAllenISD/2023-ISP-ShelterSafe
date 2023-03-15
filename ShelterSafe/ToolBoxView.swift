//
//  ToolBoxView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 12/28/22.
//

import Foundation
import SwiftUI

struct ToolBoxView : View {
    
    @State var users : [User] = []
    
    var body : some View {
        Text("hi")
            .onAppear() {
                RawData().getUsers { (users) in
                    self.users = users
                }
            }.padding()
    }

}
