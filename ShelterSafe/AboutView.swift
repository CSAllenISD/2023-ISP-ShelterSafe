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
    @State var offset : CGFloat = UIScreen.main.bounds.width
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {
            AppBar(index: self.$index, offset: self.$offset)
            
            GeometryReader {g in
                
                HStack(spacing: 0) {
                    First()
                        .frame(width: g.frame(in : .global).width)
                    
                    Second()
                        .frame(width: g.frame(in : .global).width)
                    
                    Third()
                        .frame(width: g.frame(in : .global).width)
                    
                }
                
                .offset(x: self.offset)
                
            
                .highPriorityGesture(DragGesture()
                    .onEnded({ (value) in
                        
                        if value.translation.width > 50 {
                            print ("Right")
                            self.changeView(left: false)
                        }
                        if -value.translation.width > 50 {
                            print("Left")
                            self.changeView(left: true)
                            
                        }
                        
                    }))
                
            }
            
        }
        
        .edgesIgnoringSafeArea(.all)

    }
    
    
    func changeView(left: Bool) {
        if left {
            if self.index != 3 {
                self.index += 1
            }
        } else {
            if self.index != 0 {
                self.index -= 1
            }
        }
        
        if self.index == 1 {
            
            self.offset = self.width
            
        } else if self.index == 2 {
            
            self.offset = 0
            
        } else {
            self.offset = -self.width
            
        }
        //Changes width based on size of the tabs
    }
     
}

struct AppBar: View {
    @Binding var index : Int
    @Binding var offset : CGFloat
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 1
                self.offset = 0
            }) {
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        
                        Image(systemName: "shared.with.you")
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
                self.offset = -self.width
        
            }) {
                
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "questionmark.app")
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
                self.offset = -self.width - 400

            }) {
                VStack(spacing: 8) {
                    HStack(spacing: 12) {
                        Image(systemName: "person.2")
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

struct First : View {
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 0) {
                
                
                Text("About Us")
                    .padding(.top, 8)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .top)
                
                Text("Our mission is to help you get to a Safe Place as quickly as possible. In light of natural disaster's do you know what to do or where to go? Well now you do our app will keep you updated on the weather status and how to get yourself to a safe place.")
                    .frame(width: 300)
             
                
                Text("How To Use Our App")
                    .padding(.top, 8)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .top)
                
                Text("Welcome to ShelterSafe. Please click on the tabs on the bottom to navigate the app and find a safe sheter that's suitable for you.")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                
            
            }
        }
        
        .padding(.bottom, 18)
    }
    
}

struct Second : View {
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 0) {
                
                Text("FAQ")
                    .padding(.top, 8)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .top)
                
                Text("How quick does the app update during natural disasters?")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)            }
        }
                

    }
    
}

struct Third : View {
    var body : some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 0) {
                
                Text("Contact")
                    .padding(.top, 8)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(height: 100, alignment: .top)
                
                Text("List of Numbers to Call")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
