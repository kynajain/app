//
//  User.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    var name: String
    var profileImage: String
    var bio: String
}

// Logged-in user data
let loggedInUser = User(name: "Kyna Jain", profileImage: "profile_main", bio: "Entrepreneur, Coder and Designer")
