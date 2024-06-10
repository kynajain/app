//
//  user.swift
//  Buildr
//
//  Created by Kyna Jain on 3/06/24.
//

import Foundation

struct UserChat: Identifiable {
    let id = UUID()
    var user: User // Reference to the user
    var messages: [Message]
    }

// Defining the Message struct
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isSentByCurrentUser: Bool
}

// Sample Data for UserChats
var sampleUsers = [
    UserChat(user: user1, messages: [
        Message(text: "Hello!", isSentByCurrentUser: true),
        Message(text: "How are you?", isSentByCurrentUser: false)
    ]),
    UserChat(user: user2, messages: [
        Message(text: "Hi there!", isSentByCurrentUser: false),
        Message(text: "I'm good, thanks!", isSentByCurrentUser: true)
    ]),
    UserChat(user: user3, messages: [
        Message(text: "Hello!", isSentByCurrentUser: true),
        Message(text: "How are you?", isSentByCurrentUser: false)
    ]),
    UserChat(user: user4, messages: [
        Message(text: "Hi there!", isSentByCurrentUser: false),
        Message(text: "I'm good, thanks!", isSentByCurrentUser: true)
    ]),
    UserChat(user: user5, messages: [
        Message(text: "Hey!", isSentByCurrentUser: true),
        Message(text: "What's up?", isSentByCurrentUser: false)
    ])
]

