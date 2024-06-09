//
//  EventCard.swift
//  Buildr
//
//  Created by Kyna Jain on 09/06/24.
//

import SwiftUI

struct EventCard: View {
    let post: Post
    @Binding var bookmarkedPosts: [Post]

    var body: some View {
        // Main container for the event card
        VStack(alignment: .leading, spacing: 10) {
            // Display the date
            Text(post.date)
                .font(.caption)
                .foregroundColor(.gray)
                .fixedSize(horizontal: false, vertical: true)
            
            // Aligning the profile image, title, and bookmark button
            HStack {
                // Profile image placeholder
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
                
                // Title of the event
                Text(post.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Bookmark button
                Button(action: {
                    toggleBookmark(post)
                }) {
                    // Change the icon based on the bookmark status
                    Image(systemName: isBookmarked(post) ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.blue)
                }
            }
            // Aligning items
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
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke())
        .frame(maxWidth: .infinity, maxHeight: 200) // Ensure the card takes full width
        .padding(.horizontal)
    }

    // Function to handle bookmarking logic
    private func toggleBookmark(_ post: Post) {
        // Check if the post is already bookmarked
        if let index = bookmarkedPosts.firstIndex(where: { $0.id == post.id }) {
            // If bookmarked, remove it
            bookmarkedPosts.remove(at: index)
        } else {
            // If not bookmarked, add it
            bookmarkedPosts.append(post)
        }
    }
    
    // Function to check if a post is bookmarked
    private func isBookmarked(_ post: Post) -> Bool {
        // Return true if the post is found in the bookmarked posts array
        return bookmarkedPosts.contains(where: { $0.id == post.id })
    }
}

struct EventCard_Previews: PreviewProvider {
    @State static var posts: [Post] = [
        Post(title: "Sample Event", description: "This is a sample description.", date: "10 June 2024", time: "10 am - 12 pm", location: "Library", collaborator: "John Doe")
    ]
    @State static var bookmarkedPosts: [Post] = []
    
    static var previews: some View {
        EventCard(post: posts[0], bookmarkedPosts: $bookmarkedPosts)
            .previewLayout(.sizeThatFits)
    }
}


//
//#Preview {
//    EventCard()
//}
