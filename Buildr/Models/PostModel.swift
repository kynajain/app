//
//  PostModel.swift
//  Buildr
//
//  Created by Kyna Jain on  3/06/24
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var date: String
    var time: String
    var location: String
    var collaborator: String
    var user: User // Adding a user ref
}

// Sample users
let user1 = User(name: "John Doe", profileImage: "john_doe", bio: "A passionate web developer.")
let user2 = User(name: "Jane Smith", profileImage: "jane", bio: "An enthusiastic app developer.")
let user3 = User(name: "Alice Johnson", profileImage: "alice", bio: "A creative UI/UX designer.")
let user4 = User(name: "Bob Brown", profileImage: "bob", bio: "A dedicated project manager.")
let user5 = User(name: "Charlie Davis", profileImage: "charlie", bio: "An experienced data scientist.")



// Sample posts created by the users
let ExamplePosts: [Post] = [
    Post(title: "Building Website for Fashion Startup", description: "Developing the e-commerce website", date: "15 June 2024", time: "10 am - 6 pm", location: "British Library", collaborator: "Web Developer", user: user1),
    Post(title: "Hackathon Brainstorming Session", description: "Generating ideas for hackathon.", date: "20 June 2024", time: "1 pm - 3 pm", location: "University Lab", collaborator: "Team Members", user: user2),
    Post(title: "Building chat feature of AI tool", description: "Brief", date: "June 15, 2024", time: "10 am - 6 pm", location: "BL/link", collaborator: "UI designer", user: user3),
    Post(title: "App Development Sprint", description: "Working on new app features.", date: "5 July 2024", time: "3 pm - 5 pm", location: "Room 202", collaborator: "App Developer", user: user4),
    Post(title: "Launching Conference Tech Week", description: "Creating London Teen Startup Society", date: "30 July 2024", time: "10 am - 2 pm", location: "Event Hall", collaborator: "Marketing Team", user: user5)
]

