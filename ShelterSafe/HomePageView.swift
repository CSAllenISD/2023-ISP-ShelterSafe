//
//  HomePageView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/2/23.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                ProgressView()
                    .padding()
                
                Text("Loading...")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}


