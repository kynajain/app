////
////  user.swift
////  Buildr
////
////  Created by Kyna Jain on 07/06/24.
////
//
import Foundation

// Define a User struct to represent each contact
struct UserChat: Identifiable {
    let id = UUID()
    let name: String
    var messages: [Message]
    }

    struct Message: Identifiable {
        let id = UUID()
        let text: String
        let isSentByCurrentUser: Bool
    }

// Sample Data
var sampleUsers = [
    UserChat(name: "Alice Johnson", messages: [
        Message(text: "Hello!", isSentByCurrentUser: true),
        Message(text: "How are you?", isSentByCurrentUser: false)
    ]),
    UserChat(name: "Bob Smith", messages: [
        Message(text: "Hi there!", isSentByCurrentUser: false),
        Message(text: "I'm good, thanks!", isSentByCurrentUser: true)
    ]),
    UserChat(name: "Charlie Brown", messages: [
        Message(text: "Hey!", isSentByCurrentUser: true),
        Message(text: "What's up?", isSentByCurrentUser: false)
    ])
]

//    let messages: [String]

//// Message struct to represent individual messages
//struct Message: Identifiable {
//    let id = UUID()
//    let name: String
//    let text: String
//}
