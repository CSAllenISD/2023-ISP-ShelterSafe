//
//  HomePageView.swift
//  ShelterSafe
//
//  Created by Zoe Yau on 4/2/23.
//

import SwiftUI

struct HomePageView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            if isLoggedIn {
                Text("Logged In!")
            } else {
                Button("Login") {
                    // Show the login view
                    isLoggedIn = false
                }
                .padding()
                .sheet(isPresented: $isLoggedIn) {
                    LoginView(isLoggedIn: $isLoggedIn)
                }
            }
        }
        .onAppear {
            // Check if the user is already logged in and set isLoggedIn accordingly
            isLoggedIn = false // Replace with your own login check
        }
    }
}

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""
    @State private var isLoginButtonEnabled = true
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
            
            SecureField("Password", text: $password)
                .padding()
            
            Button("Login") {
                           print("Login button tapped") // Add a debug print statement here
                           // Perform the login check here
                       }
            .padding()
        }
        .padding()
    }
    

}




