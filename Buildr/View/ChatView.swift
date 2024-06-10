//
//  ChatView.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//

import SwiftUI

struct ChatView: View {
    @Binding var users: [UserChat] // Binding to the list of user chats

    var body: some View {
        VStack {
            // Displaying the list of user chats
            List(users.indices, id: \.self) { index in
                NavigationLink(destination: ChatDetailView(userIndex: index, users: $users)) {
                    HStack {
                        // Adding profile image
                        Image(users[index].user.profileImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(.trailing, 10)
                        // Adding user name
                        Text(users[index].user.name)
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle("Chats")  
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                // Adding button to add a new user
                Button(action: addItem) {
                    Image(systemName: "plus")
                        .font(.title)
                        .padding()
                }
            }
        }
    }

    // Adding a new user to the list
    private func addItem() {
        let newUser = UserChat(user: User(name: "New User", profileImage: "profile-placeholder", bio: "New user bio"), messages: [])
        users.append(newUser)
    }
}

struct ChatView_Previews: PreviewProvider {
    @State static var users = sampleUsers // Sample data for preview

    static var previews: some View {
        ChatView(users: $users)
    }
}
