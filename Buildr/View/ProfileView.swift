//
//  ProfileView.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//
import SwiftUI

struct ProfileView: View {
    // State variables to store individual profile data
    @State private var name: String = "John Doe"
    @State private var details: String = "Software Engineer"
    @State private var college: String = "MIT"
    @State private var speciality: String = "AI & Machine Learning"
    @State private var imageName: String = "profile-placeholder"
    @Binding var bookmarkedPosts: [Post] // Binding to the bookmarked posts array

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Profile image and details
                HStack(alignment: .top) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(details)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Sections
                VStack(spacing: 10) {
                    SectionView(title: "Education", action: {
                        // Action for education
                    })
                    
                    SectionView(title: "Collaborations", action: {
                        // Action for collaborations
                    })
                    
                    SectionView(title: "Information", action: {
                        // Action for information
                    })
                    
                    HStack(spacing: 10) {
                        SectionView(title: "College", action: {
                            // Action for college
                        })
                        
                        SectionView(title: "Interests", action: {
                            // Action for interests
                        })
                    }
                }
                
                // Bookmarked Posts Section
                Text("Bookmarked Posts")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ForEach(bookmarkedPosts) { post in
                    EventCard(post: post, bookmarkedPosts: $bookmarkedPosts) // Pass bookmarkedPosts binding
                }
            }
            .padding()
        }
        .navigationTitle("Profile")
    }
}

struct SectionView: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(bookmarkedPosts: .constant(ExamplePosts))
    }
}

//
//import SwiftUI
//
//struct ProfileView: View {
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                // Large image at the top
//                Image("top_image")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(height: 200)
//                    .clipped()
//                
//                // Profile image
//                Image("imageName")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 100, height: 100)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                    .shadow(radius: 10)
//                
//                // Name and details
//                VStack {
//                    Text("Your Name")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    Text("Details about the user")
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                
//                // Buttons or sections
//                VStack(spacing: 10) {
//                    Button(action: {
//                        // Action for education
//                    }) {
//                        Text("Education")
//                            .font(.headline)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    
//                    Button(action: {
//                        // Action for collaborations
//                    }) {
//                        Text("Collaborations")
//                            .font(.headline)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    
//                    Button(action: {
//                        // Action for information
//                    }) {
//                        Text("Information")
//                            .font(.headline)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    
//                    // Additional sections
//                    HStack(spacing: 10) {
//                        Button(action: {
//                            // Action for college
//                        }) {
//                            Text("College")
//                                .font(.headline)
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                                .background(Color.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                        
//                        Button(action: {
//                            // Action for interests
//                        }) {
//                            Text("Interests")
//                                .font(.headline)
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                                .background(Color.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(10)
//                        }
//                    }
//                }
//                .padding(.horizontal)
//            }
//            .padding()
//        }
//        .navigationTitle("Profile")
//    }
//}
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
