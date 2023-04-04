//
//  NewUserView.swift
//  ShelterSafe
//
//  Created by Srisaivikas Munagala on 4/4/23.
//

//import Firebase
import SwiftUI
import UIKit

struct NewUserView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        VStack {
            Text("Sign up for ShelterSafe")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(UIColor.systemBrown))
                            .padding()
            // Username field
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Password field
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Confirm password field
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            // Create user button
            Button(action: createNewUser) {
                Text("Create Account")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemBrown))
                    .cornerRadius(10)
            }
            .padding()
        }
        //.navigationTitle("New User")
        .background(Color(UIColor.systemBackground))
        .foregroundColor(Color(UIColor.label))
    }

    
    private func createNewUser() {
        /*if password != confirmPassword {
            error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Passwords do not match."])
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                print("New user \(user.uid) created successfully.")
            } else if let error = error {
                print("Error creating new user: \(error.localizedDescription)")
                self.error = error
            }
        }*/
    }
}
