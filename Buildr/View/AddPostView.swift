import SwiftUI

struct AddPostView: View {
    @Binding var posts: [Post] // Binding to the posts array to add new posts
    @Binding var isPresented: Bool
    
    // State variables for form inputs
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date: Date = Date()
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var location: String = ""
    @State private var collaborator: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Title input
                    TextField("Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    // Description input with character limit
                    TextField("Description", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: description) { newValue, transaction in
                            if newValue.count > 50 {
                                description = String(newValue.prefix(50))
                            }
                        }
                    
                    // Date picker for selecting the date, start and end time
                    DatePicker("Pick Date", selection: $date, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                    
                    
                    DatePicker("Select Start Time", selection: $startTime, displayedComponents: .hourAndMinute)
                       .datePickerStyle(GraphicalDatePickerStyle())
                       .padding(.horizontal)

                    
                    DatePicker("Select End Time", selection: $endTime, displayedComponents: .hourAndMinute)
                       .datePickerStyle(GraphicalDatePickerStyle())
                       .padding(.horizontal)
                                       
                    
                    // Location input
                    TextField("Location", text: $location)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    // Collaborator description input with character limit
                    TextField("Collaborator Description", text: $collaborator)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .onChange(of: collaborator) { newValue, transaction in
                            if newValue.count > 30 {
                                collaborator = String(newValue.prefix(30))
                            }
                        }
                    
                    // Save button
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
                    
                    // Cancel button
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
                .padding(.bottom, 50) // Add padding at the bottom to ensure scrollable content is fully visible
            }
            .navigationTitle("Add Project")
            .navigationBarItems(leading: Button("Close") {
                cancelPost()
            })
        }
    }

    // Function to save the post and dismiss the view
    private func savePost() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium

        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short

        // Create a new post and add it to the posts array
        let newPost = Post(
            title: title,
            description: description,
            date: dateFormatter.string(from: date),
            time: "\(timeFormatter.string(from: startTime)) - \(timeFormatter.string(from: endTime))",
            location: location,
            collaborator: collaborator
        )
        posts.insert(newPost, at: 0) // Add the new post to the top of the posts array
        resetFields() // Clear the input fields
        isPresented = false // Dismiss the view
    }

    // Function to cancel post creation and dismiss the view
    private func cancelPost() {
        resetFields() // Clear the input fields
        isPresented = false // Dismiss the view
    }

    // Function to reset the input fields
    private func resetFields() {
        title = ""
        description = ""
        location = ""
        collaborator = ""
    }
}

#Preview {
    AddPostView(posts: .constant([]), isPresented: .constant(true))
}

