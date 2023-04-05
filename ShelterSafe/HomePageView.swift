//
//  HomePageView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/2/23.
//

import SwiftUI
import UIKit

struct HomePageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var sunRotationAngle: Double = 0
    @State private var textOpacity: Double = 0
    @State private var username: String = ""
    @State private var password: String = ""
    struct SmallButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.caption)
                .padding(5)
                //.foregroundColor(.white)
                //.background(configuration.isPressed ? Color.gray : Color.blue)
                .cornerRadius(10)
        }
    }
        
        var body: some View {
            ZStack {
                // Display the sun
                Image(systemName: "sun.max")
                    .font(.system(size: 100))
                    .foregroundColor(.yellow)
                    .opacity(1 - textOpacity) // Fade out the sun as the text fades in
                    .rotationEffect(Angle(degrees: sunRotationAngle))
                
                // Display the login form
                VStack {
                    Spacer()
                    Text("Sign in to Shelter Safe")
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor.systemBrown))
                        .opacity(textOpacity)
                        .padding(.top, 50)
                    VStack {
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Log In") {
                            // Perform login action
                        }
                        .padding()
                        
                        HStack {
                                Button("Forgot Password?") {
                                    // Handle forgot password action
                                }
                                .padding()
                                .buttonStyle(SmallButtonStyle())
                                Spacer()
                                Button("Sign Up") {
                                    // Handle new user action
                                }
                                .padding()
                                .buttonStyle(SmallButtonStyle())
                            }
                    }
                    .frame(width: 300, height: nil) // Center the login form
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .cornerRadius(20)
                    .padding()
                    .foregroundColor(Color(UIColor.systemBrown))
                    Spacer()
                }
                .opacity(textOpacity)
            }
            .onAppear {
                withAnimation(Animation.linear(duration: 10).repeatForever()) {
                    sunRotationAngle = 360
                }
                withAnimation(Animation.linear(duration: 1).delay(1)) {
                    textOpacity = 1
                }
            }
        }
    }
