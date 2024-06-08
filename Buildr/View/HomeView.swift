//
//  homePage.swift
//  Buildr
//
//  Created by Kyna Jain on 06/06/24.
//
//
import SwiftUI

struct HomeView: View {
    @State private var isAddPostViewActive = false
    @State private var posts: [Post] = []

    
    var body: some View {
        // Wrapping the TabView with NavigationStack to manage navigation at the top level
        NavigationStack {
            TabView {
                // Each tab's content is wrapped in a NavigationView to enable navigation within each tab
                NavigationView {
                VStack { // layout doesnt work 
                    HomePageDetails() // Home Tab
                    
                    List(posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title)
                                .font(.headline)
                            Text(post.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
//                    .navigationTitle("Buildr")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                isAddPostViewActive = true
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
                .navigationTitle("Events")
                .sheet(isPresented: $isAddPostViewActive) {
                    AddPostView(posts: $posts, isPresented: $isAddPostViewActive)
                }
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
                
                // Network Tab
                NavigationView {
                    NetworkView()
                }
                .tabItem {
                    Image(systemName: "network")
                    Text("Network")
                }

                // Chat Tab
                NavigationView {
                    ChatView()
                }
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Chat")
                }
                
                // Profile Tab
                NavigationView {
                    ProfileView()
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
        }
    }

}

struct HomePageDetails: View {
    var body: some View {
        //        VStack {
        //            // Header with title and buttons
        //            HStack {
        //                Text("Buildr")
        //                    .font(.largeTitle)
        //                    .fontWeight(.bold)
        //                Spacer()
        //                HStack {
        //                    Button(action: {}) {
        //                        Text("Feed")
        //                    }
        //                    .padding()
        //                    Button(action: {}) {
        //                        Text("Events")
        //                    }
        //                    .padding()
        //                    .background(Capsule().stroke(lineWidth: 1))
        //                }
        //            }
        //            .padding()
        //
        // Scrollable list of event cards
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<2) { _ in
                    EventCard()
                }
            }
        }
    }
}

struct EventCard: View {
    var body: some View {
        // Layout for individual event card
        VStack(alignment: .leading, spacing: 10) {
            Text("10 am, 15 June 2024")
                .font(.caption)
                .foregroundColor(.gray)
            HStack {
                Circle()
                    .frame(width: 30.0)
                    .foregroundColor(.gray)
                
                Text("Building chat feature of AI tool")
                    .font(.headline)
                    .fontWeight(.bold)
            }
            HStack {
                Image(systemName: "clock")
                Text("4-6pm")
                Spacer()
                Image(systemName: "doc.text")
                Text("Brief")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
            HStack {
                Image(systemName: "location")
                Text("BL/link")
                Spacer()
                Image(systemName: "magnifyingglass")
                Text("UI designer")
            }
            .font(.subheadline)
            .foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).stroke())
        .padding(.horizontal)
    }
}

// Preview for HomeView
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//VStack(){
//    Text("Events")
//        .font(.largeTitle)
//        .fontWeight(.bold)
//}

//struct HomePageDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePageDetails()
//    }
//}

