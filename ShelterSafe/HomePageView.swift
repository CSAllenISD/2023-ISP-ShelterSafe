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
    @State private var newUserCreated = false // add a new state variable to track if a new user is created
       // ...
    
    struct SmallButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.caption)
                .padding(5)
                .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
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
                    .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                    .opacity(1 - textOpacity) // Fade out the sun as the text fades in
                    .rotationEffect(Angle(degrees: sunRotationAngle))
                
                
                // Display the login form
                VStack {
                    Spacer()
                    Text("Sign in")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 30)
                        //.foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    VStack {
                        TextField("Email", text: $email)
                            .font(.title3)
                            .autocapitalization(.none)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .accentColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                            .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                            .cornerRadius(50.0)
                            //.shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .padding(.vertical)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50.0)
                                    .stroke(Color(red: 0.83, green: 0.71, blue: 0.71), lineWidth: 1)
                                    .padding(4)
                            )

                            /*.overlay(RoundedRectangle(cornerRadius: 5)
                                                .stroke(errorMessage != nil ? Color.red : Color(UIColor.systemBrown), lineWidth: 1))*/
                        SecureField("Password", text: $password)
                            .font(.title3)
                                .autocapitalization(.none)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(colorScheme == .dark ? Color.black : Color.white)
                                .accentColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                                .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                                .cornerRadius(50.0)
                                //.shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 50.0)
                                        .stroke(Color(red: 0.83, green: 0.71, blue: 0.71), lineWidth: 1)
                                        .padding(4)
                                )
                                
                        // Error message
                                        if let errorMessage = errorMessage {
                                            Text(errorMessage)
                                                .foregroundColor(.red)
                                                .padding()
                                        }
                        Button(action: login) {
                            Text("Sign In")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(red: 0.83, green: 0.71, blue: 0.71))
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .cornerRadius(50.0)
                                //.shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
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
                            .sheet(isPresented: $showNewUserView, onDismiss: {
                                        // this closure will be called when the sheet is dismissed
                                        if newUserCreated {
                                            showNewUserView = false // dismiss the sheet
                                            newUserCreated = false // reset the state variable for future use
                                        }
                                    }) {
                                        NewUserView(newUserCreated: $newUserCreated) // pass the binding variable to the NewUserView
                                            .frame(width: 400, height: 600)
                                    }
                            .buttonStyle(SmallButtonStyle())
                        }
                    }
                    
                    .frame(width: 300, height: nil) // Center the login form
                    //.background(colorScheme == .dark ? Color.black : Color.white)
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(20)
                    .padding()
                    //.foregroundColor(Color(UIColor.systemBrown))
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
                    
                    let alert = UIAlertController(title: "Logged in", message: "Logged in as \(self.email)", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                   let rootViewController = windowScene.windows.first?.rootViewController {
                                    rootViewController.present(alert, animated: true, completion: nil)
                                }
                    
                    
                    /*if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                       let window = windowScene.windows.first {
                                        window.rootViewController = UIHostingController(rootView: LoggedInView().frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .edgesIgnoringSafeArea(.all))
                                        window.makeKeyAndVisible()
                                    }*/
                    
                }
                
            }
        }
    }
}
