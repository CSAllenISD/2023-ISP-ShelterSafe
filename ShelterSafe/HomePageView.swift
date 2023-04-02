//
//  HomePageView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/2/23.
//

import SwiftUI

struct HomePageView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                Image(systemName: "sun.max.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding()
                    .transition(.scale)
                    .animation(.easeInOut(duration: 1))
                
                Text("Welcome to Shelter Safe")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1))
            } else {
                ProgressView()
                    .padding()
            }
        }
        .onAppear {
            withAnimation {
                self.isLoading = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isLoading = false
                }
            }
        }
    }
}




