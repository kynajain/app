//
//  ContentView.swift
//  Buildr
//
//  Created by Kyna Jain on 30/05/24.
//
import SwiftUI

struct LoginView: View {
    // State variables to hold the username and password input
    @State private var username: String = ""
    @State private var password: String = ""
    // State variables to check incorrect login
    @State private var isLoggedIn: Bool = false
    @State private var showAlert: Bool = false

    let correctUsername = "test"
    let correctPassword = "pass"

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("buildr_logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .cornerRadius(10)
                
                Text("Login")
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
                
                Button(action: login) {
                    Text("Submit")
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
                // Adding NavigationLink for the Sign Up text
                NavigationLink(destination: SignUpView()) {
                    Text("Don't have an account? Sign up")
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            }
            .padding()
            //Error alert message for incorrect login
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Invalid credentials"),
                    message: Text("The username or password you entered is incorrect. Please try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
            
        }
    }

    func login() {
        if username == correctUsername && password == correctPassword {
            isLoggedIn = true
        } else {
            showAlert = true
            print("Login failed")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


