//
//  DetailView.swift
//  ShelterSafe
//
//  Created by Onik Houqe on 11/29/22.
//

import SwiftUI

struct DetailView: View {
    
    @State var results = [TaskEntry]()
    let URL = "https://api.weather.gov/alerts/active?point="
    
  
    
    var body: some View {
        
        
        
        VStack {
            ZStack {
                Rectangle().ignoresSafeArea()
                    .foregroundColor(.blue)
                    .frame(height: 100)
                    
                HStack {
                    VStack {
                        Text("Disaster Status")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.leading, 15.0)
                            .offset(x: 0, y: 20)
                        
                    }
                    Spacer()
                }
            }
                
            
            Spacer()
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
