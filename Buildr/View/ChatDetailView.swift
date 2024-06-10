//
//  ItemDetailsView.swift
//  Buildr
//
//  Created by Kyna Jain on 07/06/24.
//

import SwiftUI

struct ChatDetailView: View {
    var userIndex: Int // Index of the user in the list
    @Binding var users: [UserChat] // Binding to the list of user chats
    @State private var typedMessage: String = "" // State for the typed message

    var body: some View {
        VStack {
            // Displaying the list of messages, reffered to nativescript code from class for the logic
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(users[userIndex].messages) { message in
                        HStack {
                            if message.isSentByCurrentUser {
                                Spacer() // Aligning sent messages to the right
                                Text(message.text)
                                    .padding()
                                    .background(Color.indigo)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(maxWidth: 250, alignment: .trailing)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .frame(maxWidth: 250, alignment: .leading)
                                Spacer() // Aligning received messages to the left
                            }
                        }
                        .padding()
                    }
                }
            }
            
            Spacer()
            
            // Adding input field and send button
            HStack {
                TextField("Type your message here", text: $typedMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 40)
                    .border(Color.indigo, width: 1)

                Button(action: sendMessage) {
                    Text("Send")
                        .frame(minWidth: 50, minHeight: 40)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Chat with \(users[userIndex].user.name)")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(users[userIndex].user.name)
                    .font(.headline)
            }
        }
    }

    // Sending a message, reffered to nativescript code from class
    private func sendMessage() {
        if !typedMessage.isEmpty {
            let newMessage = Message(text: typedMessage, isSentByCurrentUser: true)
            users[userIndex].messages.append(newMessage) // Adding the new message to the list
            typedMessage = "" // Clearing the input field
        }
    }
}
