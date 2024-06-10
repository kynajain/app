//
//  UserProfileView.swift
//  Buildr
//
//  Created by Kyna Jain on 3/06/24.
//

import SwiftUI

struct UserProfileView: View {
    
    let user: User // User object containing profile data
    
    var body: some View {
        ScrollView {
            VStack(spacing: 50){
                // Adding background image with overlay
                ZStack {
                    Image("background_1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                        .clipped()
                                    
                    // Overlay
                    Color.black.opacity(0.4)
                        .frame(maxWidth: .infinity)
                        .frame(height: 400)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                
                VStack {
                    // Profile image
                    Image(user.profileImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                    
                    // Name
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.top, -60) // to overlap the background

                // Bio
                VStack(alignment: .leading) {
                    Text(user.bio)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
                // Displaying interests
                VStack(alignment: .leading) {
                    Text("Interests")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                        HStack(spacing: 20) {
                            ForEach(interests, id: \.name) { interest in
                                VStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(.indigo)
                                        Image(systemName: interest.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 20, height: 30)
                                            .foregroundColor(.white)
                                        
                                    }
                                    Text(interest.name)
                                        .font(.caption)
                                        .multilineTextAlignment(.center)
                                        .frame(width: 60)
                                        .foregroundColor(.indigo)
                                }
                            }
                        }
                        .padding(.horizontal)
                    
                }
                // Adding follow button
                Button(action: {
                    // Follow action to be implemneted in future
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Follow")
                            .fontWeight(.bold)
                    }
                    .padding()
                    .foregroundColor(.black)
                    .background(Color(red: 227/255, green: 230/255, blue: 92/255))
                    .cornerRadius(10)
                }
                
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.top, -60)
        }
        .edgesIgnoringSafeArea(.top) // Extending background to the top
    }
}

// Example user for preview
let exampleUser = User(
    name: "John Doe",
    profileImage: "profile_main",
    bio: "Tech aficionados!"
)

let interests: [Interest] = [
    Interest(name: "Coding", imageName: "laptopcomputer"),
    Interest(name: "Reading", imageName: "book"),
    Interest(name: "Fitness", imageName: "figure.walk")
]

// Model for Interest
struct Interest {
    let name: String
    let imageName: String
}


struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: exampleUser)
    }
}
