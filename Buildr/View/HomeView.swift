//
//  homePage.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//
//
import SwiftUI

struct HomeView: View {
    @State private var isAddPostViewActive = false // Variable to control the presentation of the AddPostView
    @State private var posts: [Post] = ExamplePosts
    @State private var bookmarkedPosts: [Post] = [] // State to hold bookmarked posts
    @State private var searchText: String = "" // variable to hold the search text

    var body: some View {
        // Wrapping the TabView with NavigationStack to manage navigation at the top level
        NavigationStack {
            TabView {
                NavigationView { // Each tab's content is wrapped in a NavigationView to enable navigation within each tab
                    VStack {
                        // Using HomePageDetails to get filtered posts
                        HomePageDetails(posts: $posts, bookmarkedPosts: $bookmarkedPosts, searchText: $searchText)
                    }
                    .navigationTitle("Event")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            // Search bar in the toolbar
                            SearchBar(text: $searchText)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            // Plus button in the toolbar
                            Button(action: {
                                isAddPostViewActive = true
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    .sheet(isPresented: $isAddPostViewActive) { // Present the AddPostView when isAddPostViewActive is true
                        AddPostView(posts: $posts, isPresented: $isAddPostViewActive)
                    }
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

                // Network Tab
                NavigationView {
                    NetworkView()
                }
                .tabItem {
                    Image(systemName: "network")
                    Text("Network")
                }

                // Chat Tab
                NavigationView {
                    ChatView()
                }
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Chat")
                }

                // Profile Tab
                NavigationView {
                    ProfileView(bookmarkedPosts: $bookmarkedPosts)
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
            // Search icon
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            // Text field for search input
            TextField("Search...", text: $text, onCommit: {
                // Clear the search text when the user presses return
                text = ""
            })
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            
            // Clear button
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal, 10)
    }
}

// Preview for HomeView
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
