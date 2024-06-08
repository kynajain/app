//
//  ChatView.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//
import SwiftUI

struct ChatView: View {
    //    @State private var contacts: [String] = ["Alice", "Bob", "Charlie"]
    @State private var users = [
        User(name: "Alice", messages: ["Hello!", "How are you?"]),
        User(name: "Bob", messages: ["Hi there!"]),
        User(name: "Charlie", messages: ["Hey!", "What's up?"])]
    
    var body: some View {
            VStack {
                // Navigation bar with title and add button
                HStack {
                    Text("Chats")
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    Button(action: addItem) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                    }
                }
                
                // List to display contacts
                List(users) { user in
                    NavigationLink(destination: ChatDView(user: user)) {
                        Text(user.name)
                            .padding()
                    }
                }
            }
            .navigationBarTitle("") // Empty string to remove default navigation bar title
            .navigationBarHidden(true) // Hide default navigation bar
        }
    
    
    private func addItem() {
        // Function to add a new contact (for demonstration purposes, it adds a placeholder contact)
        let newUser = User(name: "User \(users.count + 1)", messages: [])
        users.append(newUser)
    }
    
    struct ChatView_Previews: PreviewProvider {
        static var previews: some View {
            ChatView()
        }
    }
    
    struct ChatDView: View {
        let user: User
        
        var body: some View {
            VStack(alignment: .leading) {
                ForEach(user.messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
            }
            .navigationTitle("Chat with \(user.name)")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(user.name)
                        .font(.headline) // Make the navigation text smaller
                }
            }
        }
    }
}
    



//struct ChatView: View {
//    // State variables to manage contacts
////    @State private var users = ["Person B", "Person C"]
//    @State private var users = [
//                User(name: "Alice Johnson", messages: ["Hello!", "How are you?"]),
//                User(name: "Bob Smith", messages: ["Hi there!"]),
//                User(name: "Charlie Brown", messages: ["Hey!", "What's up?"])]
////    NavigationView {
//        List(users) { user in
//            NavigationLink(destination: ChatDView(user: user)) {
//                Text(user.name) // Display each user name
//                    .padding() // Add space around each name
//            }
//        }
//        .navigationBarTitle("Chat Users", displayMode: .inline)
//        .navigationBarItems(trailing: Button(action: addUser) {
//            Image(systemName: "plus") // "+" icon
//        })
//    }
//}
//    var body: some View {
//        NavigationView {
//            List(users) { user in
//                NavigationLink(destination: ChatDetailView(user: user)) {
//                    Text(user.name) // Display each user name
//                        .padding() // Add space around each name
//                }
//            }
//            .navigationBarTitle("Chat Users", displayMode: .inline)
//            .navigationBarItems(trailing: Button(action: addUser) {
//                Image(systemName: "plus") // "+" icon
//            })
//        }
//    }

//    // Function to add a new contact
//    private func addItem() {
//        let newItem = "Person \(users.count + 1)"
//        users.append(newItem)
//    }
//}

//// Message struct to represent individual messages
//struct Message: Identifiable {
//    let id = UUID()
//    let name: String
//    let text: String
//}

//// Preview for ChatView
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
////
//import SwiftUI
//
//struct ChatView: View {
//    // State variables to manage contacts
////    @State private var contacts = ["Person 1", "Person 2"]
//    @State private var users = [
//            User(name: "Alice Johnson", messages: ["Hello!", "How are you?"]),
//            User(name: "Bob Smith", messages: ["Hi there!"]),
//            User(name: "Charlie Brown", messages: ["Hey!", "What's up?"]),
//            User(name: "Diana Prince", messages: ["Good day!"]),
//            User(name: "Ethan Hunt", messages: ["Mission accomplished."]),
//            User(name: "Fiona Gallagher", messages: ["Hello!", "See you soon."])
//        ]
//
//    var body: some View {
//        VStack {
//            // Navigation bar with title and add button
//            HStack {
//                Text("Chats")
//                    .font(.largeTitle)
//                    .padding()
//                Spacer()
//                Button(action: addItem) {
//                    Image(systemName: "plus")
//                        .font(.title)
//                        .padding()
//                }
//            }
//            NavigationView(content: {
//                List(users) { user in
//                    NavigationLink(destination: ChatDetailView(user: user)) {
//                        Text(user.name) // Display each user name
//                            .padding() // Add space around each name
//                    }
//                }
//            })
//            
//        }
//    }
//
//    // Function to add a new contact
//    private func addItem() {
//        let newUser = User(name: "User \(users.count + 1)", messages: [])
//        users.append(newUser)
//    }
//}
//
//
//
//// Preview for ChatView
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
//
