//
//  ChatView.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//
import SwiftUI

struct ChatView: View {
    // State var to store contacts information
    @State private var users = sampleUsers
    
    var body: some View {
        VStack {
            // List to display contacts
            List(users.indices, id: \.self) { index in
                NavigationLink(destination: ChatDetailView(user: $users[index])) {
                    Text(users[index].name)
                        .padding()
                }
            }
        }
        .navigationBarTitle("Chats")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: addItem) {
                    Image(systemName: "plus")
                        .font(.title)
                        .padding()
                }
            }
        }
    }
    
    
    private func addItem() {
        // Function to add a new contact
        let newUser = UserChat(name: "User \(users.count + 1)", messages: [])
        users.append(newUser)
    }
    
    
}
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
    


