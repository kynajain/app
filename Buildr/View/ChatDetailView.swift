//////
//////  ItemDetailsView.swift
//////  Buildr
//////
//////  Created by Kyna Jain on 07/06/24.
//////
////
import SwiftUI

struct ChatDetailView: View {
    @Binding var user: UserChat// Binding to the user data
    @State private var typedMessage: String = "" // State for the typed message
    
    var body: some View {
        VStack {
            // Display the list of messages
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(user.messages) { message in
                        HStack {
                            if message.isSentByCurrentUser {
                                Spacer() // Push the message to the right for sent messages
                                Text(message.text)
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .frame(maxWidth: 250, alignment: .trailing)
                            } else {
                                Text(message.text)
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                    .frame(maxWidth: 250, alignment: .leading)
                                Spacer() // Push the message to the left for received messages
                            }
                        }
                        .padding()
                    }
                }
            }
            
            Spacer() // Pushing the input field and send button to the bottom
            
            // Input field and send button
            HStack {
                TextField("Type your message here", text: $typedMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 40)
                
                Button(action: sendMessage) {
                    Text("Send")
                        .frame(minWidth: 50, minHeight: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Chat with \(user.name)")
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(user.name)
                    .font(.headline)
            }
        }
    }
    
    // Function to send a message
    private func sendMessage() {
        // Check if the message is not empty
        if !typedMessage.isEmpty {
            let newMessage = Message(text: typedMessage, isSentByCurrentUser: true)
            user.messages.append(newMessage) // Add the new message to the user's messages
            typedMessage = "" // Clear the input field
        }
    }
}

#Preview {
    ChatDetailView(user: .constant(sampleUsers[0]))
}
