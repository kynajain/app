//////
//////  ItemDetailsView.swift
//////  Buildr
//////
//////  Created by Kyna Jain on 07/06/24.
//////
////
//import SwiftUI
//
//struct ChatDetailView: View {
//    var body: some View {
//        VStack {
//            //                    Text("Chat with \(user.name)")
//            //                        .font(.largeTitle)
//            //                        .padding()
//            //                    // Add more UI elements to show chat messages or details here
//            //                    Spacer()
//            //                }
//            //                .navigationBarTitle(Text(user.name), displayMode: .inline)
//        }
//    }
//}
//
//
//#Preview {
//    ChatDetailView()
//}


////
////  ChatViewDetails.swift
////  Buildr
////
////  Created by Kyna Jain on 07/06/24.
////
//
//import SwiftUI
//
//// Detail view to display messages for a selected contact and send new messages
//struct ChatViewDetails: View {
//    let name: String
//    @Binding var messages: [Message]
//    @State private var typedMessage = ""
//
//    var body: some View {
//        VStack {
//            // ScrollView to display messages
//            ScrollView {
//                VStack(alignment: .leading, spacing: 10) {
//                    ForEach(messages) { message in
//                        Text(message.text)
//                            .padding()
//                            .background(message.name == "Person B" ? Color.green : Color.gray)
//                            .cornerRadius(10)
//                            .frame(maxWidth: .infinity, alignment: message.name == "Person B" ? .leading : .trailing)
//                    }
//                }
//                .padding()
//            }
//
//            // HStack to input and send new messages
//            HStack {
//                TextField("Type your message here", text: $typedMessage)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(minHeight: 40)
//
//                Button(action: sendMessage) {
//                    Text("Send")
//                        .frame(minWidth: 50, minHeight: 40)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//        .navigationBarTitle(Text(name), displayMode: .inline)
//        .navigationBarItems(leading: Button(action: {
//            // Code to navigate back
//        }) {
//            Image(systemName: "arrow.left") // Back button icon
//        })
//    }
//
//    // Function to send a new message
//    private func sendMessage() {
//        if !typedMessage.trimmingCharacters(in: .whitespaces).isEmpty {
//            messages.append(Message(name: "Person A", text: typedMessage))
//            typedMessage = ""
//        }
//    }
//}
//
//// Preview for ChatViewDetails
//struct ChatViewDetails_Previews: PreviewProvider {
//    @State static var messages = [
//        Message(name: "Person A", text: "Hello"),
//        Message(name: "Person B", text: "Hi")
//    ]
//    static var previews: some View {
//        ChatViewDetails(name: "Person B", messages: $messages)
//    }
//}
