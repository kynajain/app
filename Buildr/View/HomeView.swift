//
//  homePage.swift
//  Buildr
//
//  Created by Kyna Jain on 30/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isAddPostViewActive = false // Variable to control the presentation of the AddPostView
    // State to display presxiting posts and to hold bookmarked posts
    @State private var posts: [Post] = ExamplePosts
    @State private var bookmarkedPosts: [Post] = []
    @State private var searchText: String = "" // variable to hold the search text
    @State private var users: [UserChat] = sampleUsers // State to hold chat users
    @State private var currentUser : User = loggedInUser  // variable to hold current user
   

    var body: some View {
        // Wrapping the TabView with NavigationStack to manage navigation on al l pages
        NavigationStack {
            TabView {
                NavigationView {
                    VStack {
                        // getting filtered/bookmarked posts
                        HomePageDetails(posts: $posts, bookmarkedPosts: $bookmarkedPosts, searchText: $searchText, users: $users)
                    }
                    .navigationTitle("Events")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            // Search bar in the toolbar
                            SearchBar(text: $searchText)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            // Plus button in the toolbar
                            Button(action: {
                                isAddPostViewActive = true //Present AddPostView
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .sheet(isPresented: $isAddPostViewActive) { // Present the AddPostView when isAddPostViewActive is true and add content of the sheet
                        AddPostView(posts: $posts, isPresented: $isAddPostViewActive, user: currentUser)
                    }
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

                // Chat Tab
                NavigationView {
                    ChatView(users: $users)
                }
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Chat")
                }

                // Profile Tab
                NavigationView {
                    ProfileView(bookmarkedPosts: $bookmarkedPosts, users: $users, currentUser: $currentUser)
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String // Binding to the search text

    var body: some View {
        HStack {
            // Search
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("Search...", text: $text)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            // Cancel search button
            if !text.isEmpty {
                Button(action: {
                    text = "" // Clearing text
                }) {
                    Image(systemName: "xmark.circle.fill") //cancel icon
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 10)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

