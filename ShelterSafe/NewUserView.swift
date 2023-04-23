//
//  NewUserView.swift
//  ShelterSafe
//
//  Created by Srisaivikas Munagala on 4/4/23.
//

//import Firebase
import SwiftUI
import UIKit
import FirebaseAuth

struct IdentifiableError: Identifiable {
    let id = UUID()
    let error: Error
}

struct NewUserView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var error: Error? = nil
    //@State private var authError: IdentifiableError? = nil
    @State private var errorMessage: String?
    @Binding var newUserCreated: Bool // add a binding variable to track if a new user is created
    
    
    var body: some View {
        Group{
                VStack {
                    Text("Sign up for ShelterSafe")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                        .padding()
                    // Username field
                    TextField("Email", text: $email)
                        .font(.title3)
                        .padding()
                        .autocapitalization(.none)
                        .accentColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                    //.frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                        .cornerRadius(50.0)
                        .frame(width: 300)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    
                    // Password field
                    SecureField("Password", text: $password)
                        .font(.title3)
                        .padding()
                        .autocapitalization(.none)
                        .accentColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                    //.frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                        .cornerRadius(50.0)
                        .frame(width: 300)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    
                    // Confirm password field
                    SecureField("Confirm Password", text: $confirmPassword)
                        .font(.title3)
                        .padding()
                        .autocapitalization(.none)
                        .accentColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                    //.frame(maxWidth: .infinity)
                        .background(colorScheme == .dark ? Color.black : Color.white)
                        .foregroundColor(Color(red: 0.83, green: 0.71, blue: 0.71))
                    
                    
                        .cornerRadius(50.0)
                        .frame(width: 300)
                        .shadow(color: Color.black.opacity(0.08), radius: 60, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 16)
                        .padding(.vertical)
                    //error message
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    // Create user button
                    Button(action: createNewUser) {
                        Text("Create Account")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                        //.frame(maxWidth: .infinity)
                            .background(Color(red: 0.83, green: 0.71, blue: 0.71))
                            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                            .padding(.vertical)
                        
                    }
                    //.padding()
                    

                    
                }
                //.navigationTitle("New User")
                .background(Color(UIColor.systemBackground))
                .foregroundColor(Color(UIColor.label))
            }
        }
        
    public func createNewUser() {
        if password != confirmPassword {
            errorMessage = "Passwords do not match."
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                print("New user \(user.uid) created successfully.")
                newUserCreated = true
                closeSheet()
            } else if let error = error {
                print("Error creating new user: \(error.localizedDescription)")
                errorMessage = error.localizedDescription
            }
        }
    }
    }
func closeSheet() {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let window = windowScene.windows.first(where: { $0.isKeyWindow }),
          let viewController = window.rootViewController?.presentedViewController else {
              print("Unable to close sheet: could not find presented view controller.")
              return
          }
    
    viewController.dismiss(animated: true, completion: nil)
}
