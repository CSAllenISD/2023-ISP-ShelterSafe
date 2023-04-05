//
//  HomePageView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/2/23.
//

import SwiftUI
import UIKit
import FirebaseAuth

struct HomePageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var sunRotationAngle: Double = 0
    @State private var textOpacity: Double = 0
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showNewUserView = false
    @State private var errorMessage: String?
    
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
        NavigationView {
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
                        .fontWeight(.bold)
                        .foregroundColor(Color(UIColor.systemBrown))
                        .opacity(textOpacity)
                        .padding(.top, 50)
                    VStack {
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .accentColor(Color(UIColor.systemBrown))
                            .background(
                                    Color.red.opacity(errorMessage != nil ? 0.2 : 0)
                                        .cornerRadius(8)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.red.opacity(errorMessage != nil ? 0.5 : 0), lineWidth: 2)
                                )
                            /*.overlay(RoundedRectangle(cornerRadius: 5)
                                                .stroke(errorMessage != nil ? Color.red : Color(UIColor.systemBrown), lineWidth: 1))*/
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .accentColor(Color(UIColor.systemBrown))
                            .padding()
                            .background(
                                    Color.red.opacity(errorMessage != nil ? 0.2 : 0)
                                        .cornerRadius(4)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.red.opacity(errorMessage != nil ? 0.5 : 0), lineWidth: 2)
                                )
                            /*.overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(errorMessage != nil ? Color.red : Color(UIColor.systemBrown), lineWidth: 1))*/
                        
                        // Error message
                                        if let errorMessage = errorMessage {
                                            Text(errorMessage)
                                                .foregroundColor(.red)
                                                .padding()
                                        }
                        /*Button("Log In") {
                         // Perform login action
                         }*/
                        Button(action: login) {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemBrown))
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        HStack {
                            Button("Forgot Password?") {
                                // Handle forgot password action
                            }
                            .padding()
                            .buttonStyle(SmallButtonStyle())
                            Spacer()
                            /*NavigationLink(destination: NewUserView(), isActive: $showNewUserView) {
                             Text("New User")
                             }*/
                            Button(action: { showNewUserView = true }) {
                                Text("Sign up")
                            }
                            /*Button("Sign Up") {
                             // Handle new user action
                             NewUserView()
                             }*/
                            .padding()
                            .sheet(isPresented: $showNewUserView) {
                                NewUserView()
                            }
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
                .navigationTitle("")
                .navigationBarHidden(true)
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
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = nil
                // Handle successful login
                if let authResult = result {
                    print("Login succesful to \(authResult.user.uid)")
                }
                
            }
        }
    }
}
