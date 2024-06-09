//////
//////  HomePageDetailsView.swift
//////  Buildr
//////
//////  Created by Kyna Jain on 08/06/24.
//////
////
import SwiftUI

struct HomePageDetails: View {
    //  Binding to the state variables from the home view
    @Binding var posts: [Post]
    @Binding var bookmarkedPosts: [Post]
    @Binding var searchText: String

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Filter posts based on search text
                ForEach(filteredPosts) { post in
                    EventCard(post: post, bookmarkedPosts: $bookmarkedPosts) // Display each post as an event card
                }
            }
        }
    }

    // Computed property to filter posts based on search text
    private var filteredPosts: [Post] {
        if searchText.isEmpty {
            return posts // Return all posts if search text is empty
        } else {
            // Filter posts based on whether the search text is found in the title or collaborator
            return posts.filter { post in
                post.title.localizedCaseInsensitiveContains(searchText) || post.collaborator.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
