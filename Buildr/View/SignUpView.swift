//
//  SignUpView.swift
//  Buildr
//
//  Created by Kyna Jain on 30/05/24.
//

import SwiftUI

struct SignUpView: View {
    // State variables to hold the sign-up input fields
        @State private var username: String = ""
        @State private var password: String = ""
        @State private var confirmPassword: String = ""
        // State variables to check incorrect login
        @State private var isLoggedIn: Bool = false
        @State private var showAlert: Bool = false
        @State private var alertMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("buildr_logo")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(10)
            
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(width: 300)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .frame(width: 300)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .frame(width: 300)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            
            Button(action: signUp) {
                Text("Sign Up")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.indigo)
                    .cornerRadius(10)
            }
            .navigationDestination(isPresented: $isLoggedIn) { //Navigation to HomeView when isLoggedIn is true
                HomeView()
                    .navigationBarBackButtonHidden(true) //hiding back button
            }
        }
        .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Sign-up Error"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }

    func signUp() {
        // Checking if any of the fields are empty
            if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
                alertMessage = "All fields are required."
                showAlert = true
            } else if password != confirmPassword { // Checking if the password and confirm password match
                alertMessage = "Passwords do not match."
                showAlert = true
            } else {
                isLoggedIn = true  // setting isLoggedIn to true to navigate to the next screen
                print("Sign-up successful")
            }
        }
    }

#Preview {
    SignUpView()
}
