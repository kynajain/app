import SwiftUI

struct AddPostView: View {
    @Binding var posts: [Post] // Binding to the posts array to add new posts
    @Binding var isPresented: Bool
    @State private var title: String = ""
    @State private var description: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Text("Add Project")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Description", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            
                Button(action: {
                                    savePost()
                                }) {
                                    Text("Save Post")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                                .padding()

                                Button(action: {
                                    cancelPost()
                                }) {
                                    Text("Cancel")
                                        .font(.title2)
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(10)
                                }
                                .padding()
                                
                                Spacer()
                            }
                            .navigationTitle("Add Project")
                            .navigationBarItems(leading: Button("Close") {
                                cancelPost()
                            })
                        }
                    }
                    
                    // Function to save the post and dismiss the view
                    private func savePost() {
                        let newPost = Post(title: title, description: description)
                        posts.append(newPost) // Add the new post to the posts array
                        resetFields() // Clear the text fields
                        isPresented = false // Dismiss the view and navigate back to HomeView
                    }

                    // Function to cancel the post creation and dismiss the view
                    private func cancelPost() {
                        resetFields() // Clear the text fields
                        isPresented = false
                        // Dismiss the view and navigate back to HomeView
                    }

                    // Function to reset the text fields
                    private func resetFields() {
                        title = "" // Clear the title field
                        description = "" // Clear the description field
                    }
                }

                #Preview {
                    AddPostView(posts: .constant([]), isPresented: .constant(true))
                }

//                Button(action: {
//                    let newPost = Post(title: title, description: description)
//                    posts.append(newPost) // Add the new post to the posts array
//                    isPresented = false // Dismiss the view
//                    }){
//                    Text("Save Post")
//                        .font(.title2)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                Button(action: {
//                    isPresented = false // Dismiss the view without saving
//                }) {
//                    Text("Cancel")
//                        .font(.title2)
//                        .foregroundColor(.red)
//                        .padding()
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(10)
//                }
//                .padding()
//                
//                Spacer()
//            }
//            .navigationTitle("Add Project")
//            .navigationBarItems(leading: Button("Close") {
//                // Logic to close the view can be added here if needed
//            })
//        }
//    }
//}
//
//#Preview {
//    AddPostView(posts: .constant([]),isPresented: .constant(true))
//   }
