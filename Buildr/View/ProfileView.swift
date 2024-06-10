//
//  ProfileView.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//
import SwiftUI

struct ProfileView: View {
    // Binding to the state variables from the home view
    @Binding var bookmarkedPosts: [Post]
    @Binding var users: [UserChat]
    @Binding var currentUser: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Adding profile image and details
                HStack(alignment: .top) {
                    Image(currentUser.profileImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    VStack(alignment: .leading) {
                        Text(currentUser.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(currentUser.bio)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Adding sections with rectangles
                VStack(spacing: 10) {
                    RectangleSectionView(title: "Education")
                    RectangleSectionView(title: "Collaborations")
                    RectangleSectionView(title: "Information")
                    
                    HStack(spacing: 10) {
                        RectangleSectionView(title: "College")
                        RectangleSectionView(title: "Interests")
                    }
                }
                
                // Adding and displaying bookmarked posts
                Text("Bookmarked Posts")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                Spacer()
                
                ForEach(bookmarkedPosts) { post in
                    EventCard(post: post, bookmarkedPosts: $bookmarkedPosts, users: $users)
                    Spacer()
                }
            }
            .padding()
        }
        .navigationTitle("Profile")
    }
}

struct RectangleSectionView: View {
    var title: String

    var body: some View {
        Text(title)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.indigo)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(bookmarkedPosts: .constant(ExamplePosts), users: .constant(sampleUsers), currentUser: .constant(loggedInUser))
    }
}
