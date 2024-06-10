//
//  HomePageDetailsView.swift
//  Buildr
//
//  Created by Kyna Jain on 3/06/24.
//

import SwiftUI

struct HomePageDetails: View {
    //  Binding to the state variables from the home view
    @Binding var posts: [Post]
    @Binding var bookmarkedPosts: [Post]
    @Binding var searchText: String
    @Binding var users: [UserChat]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Filtering posts based on search text
                Spacer()
                ForEach(filteredPosts) { post in
                    EventCard(post: post, bookmarkedPosts: $bookmarkedPosts, users: $users) 
                    // Display each post as an event card
                Spacer()
                }
            }
        }
    }

    // Computed property to filter posts based on search text
    private var filteredPosts: [Post] {
        if searchText.isEmpty {
            return posts // Returning all posts if search text is empty
        } else {
            // Filtering posts based on whether the search text is found in the title or collaborator
            return posts.filter { post in
                post.title.localizedCaseInsensitiveContains(searchText) || post.collaborator.localizedCaseInsensitiveContains(searchText) //Chatgpt 3.5 used to get functioning of filtered posts eg. making it caseinsensitive
            }
        }
    }
}
struct HomePageDetails_Previews: PreviewProvider {
    @State static var posts: [Post] = ExamplePosts
    @State static var bookmarkedPosts: [Post] = []
    @State static var searchText: String = ""
    @State static var users: [UserChat] = sampleUsers
    
    static var previews: some View {
        HomePageDetails(posts: $posts, bookmarkedPosts: $bookmarkedPosts, searchText: $searchText, users: $users)
    }
}
