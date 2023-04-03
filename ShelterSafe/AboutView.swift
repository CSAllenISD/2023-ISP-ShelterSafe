//
//  AboutView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/3/23.
//

import SwiftUI
import UIKit

struct AboutView: View {
    var body: some View {
        
        Home()
    }
}

struct Home: View {
    @State var index = 1
    @State var offset : CGFloat = 0
    
    var body: some View {
        VStack(spacing: 0) {
            AppBar(index: self.$index, offset: self.$offset)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct AppBar: View {
    @Binding var index : Int
    @Binding var offset : CGFloat
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 1
            }) {
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                
                        Image("Person")
                            .foregroundColor(self.index == 1 ? . white : Color.white.opacity(0.7))
                        
                        Text("About Us")
                            .foregroundColor(self.index == 1 ? . white : Color.white.opacity(0.7))
            
                    }
                    
                    Capsule()
                        .fill(self.index == 1 ? Color.white : Color.clear)
                        .frame(height: 4)
                }
            }
            
            Button(action: {
                self.index = 2
                
            }) {
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        Image("questionmark.app")
                            .foregroundColor(self.index == 2 ? . white : Color.white.opacity(0.7))
                        
                        Text("FAQ")
                            .foregroundColor(self.index == 2 ? . white : Color.white.opacity(0.7))
            
                    }
                    
                    Capsule()
                        .fill(self.index == 2 ? Color.white : Color.clear)
                        .frame(height: 4)
                }

            }
            
            Button(action: {
                self.index = 3
                
            }) {
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        Image("Profile")
                            .foregroundColor(self.index == 3 ? . white : Color.white.opacity(0.7))
                        
                        Text("Contact")
                            .foregroundColor(self.index == 3 ? . white : Color.white.opacity(0.7))
            
                    }
                    
                    Capsule()
                        .fill(self.index == 3 ? Color.white : Color.clear)
                        .frame(height: 4)
                }

            }
            
        }
        
        .padding(.top, 60)
        .padding(.horizontal)
        .padding(.bottom, 8)
        .background(Color(UIColor.systemBrown))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
