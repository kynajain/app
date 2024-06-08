////
////  user.swift
////  Buildr
////
////  Created by Kyna Jain on 07/06/24.
////
//
import Foundation

// Define a User struct to represent each contact
struct User: Identifiable {
    let id = UUID()
    let name: String
    let messages: [String]
}

//struct Message: Identifiable {
//    let id = UUID()
//    let content: String
//    let isSentByCurrentUser: Bool
//}
//// Message struct to represent individual messages
//struct Message: Identifiable {
//    let id = UUID()
//    let name: String
//    let text: String
//}
