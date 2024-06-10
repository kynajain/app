//
//  EventCard.swift
//  Buildr
//
//  Created by Kyna Jain on 3/06/24.
//
import SwiftUI

struct EventCard: View {
    let post: Post
    // Binding to the list of bookmarked posts and user chats from the HomeView
    @Binding var bookmarkedPosts: [Post]
    @Binding var users: [UserChat]

    var body: some View {
        // Creating main container for the event card
        VStack(alignment: .leading, spacing: 10) {
            // Displaying the date
            Text(post.date)
                .font(.caption)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
            
            // Aligning the profile image, title, and bookmark button
            HStack {
                // Profile image placeholder
                NavigationLink(destination: UserProfileView(user: post.user)) {
                    Image(post.user.profileImage)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .foregroundColor(.gray)
                }
                // Title of the event
                Text(post.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Aligning the time and description
            HStack {
                Image(systemName: "clock")
                Text(post.time)
                Spacer()
                Image(systemName: "doc.text")
                Text(post.description)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            .fixedSize(horizontal: false, vertical: true)
            
            // Aligning location and collaborator
            HStack {
                Image(systemName: "location")
                Text(post.location)
                Spacer()
                Image(systemName: "magnifyingglass")
                Text(post.collaborator)
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            .fixedSize(horizontal: false, vertical: true)
            
            // Bookmark and reply buttons
            HStack {
                Button(action: {
                    toggleBookmark(post:post)
                }) {
                    // Changing the icon based on the bookmark status
                    Image(systemName: isBookmarked(post: post) ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.indigo)
                }
                
                // Handling the index and linking post and chat usesr
                if let userIndex = users.firstIndex(where: { $0.user.id == post.user.id }) {  // Used Chatgpt 3.5 for understanding how to link both ids
                    NavigationLink(destination: ChatDetailView(userIndex: userIndex, users: $users)) {
                        Image(systemName: "arrowshape.turn.up.left")
                            .foregroundColor(.indigo)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing) // Aligning buttons to the right
        
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10) // Adding background
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        )
        .frame(maxWidth: .infinity, maxHeight: 200) // Ensuring the card takes full width width
        .padding(.horizontal)
    }

    // Function to handle bookmarking logic
    private func toggleBookmark(post: Post) {
        var indexToRemove = -1 // Using -1 to represent not found

        for (index, bookmarkedPost) in bookmarkedPosts.enumerated() {
            if bookmarkedPost.id == post.id {
                indexToRemove = index // Storing the index of the post to remove later
                break
            }
        }
        // If indexToRemove has a value, the post is already bookmarked
        if indexToRemove != -1 {
            bookmarkedPosts.remove(at: indexToRemove)
        } else {
            bookmarkedPosts.append(post)
        }
    }

    // Function to check if a post is bookmarked
    private func isBookmarked(post: Post) -> Bool {
        // Check if the post is in the bookmarkedPosts array
        for bookmarkedPost in bookmarkedPosts {
            if bookmarkedPost.id == post.id {
                return true
            }
        }
        return false
    }

}

struct EventCard_Previews: PreviewProvider {
    @State static var bookmarkedPosts: [Post] = []
    @State static var users = sampleUsers
    
    static var previews: some View {
        // Providing preview with sample data
        EventCard(post: ExamplePosts[0], bookmarkedPosts: $bookmarkedPosts, users: $users)
    }
}
