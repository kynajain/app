//
//  PostModel.swift
//  Buildr
//
//  Created by Kyna Jain on 08/06/24.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var date: String
    var time: String
    var location: String
    var collaborator: String
}


let ExamplePosts: [Post] = [
    Post(title: "Building Website for Fashion Startup", description: "Developing the e-commerce website", date: "15 June 2024", time: "10 am - 6 pm", location: "British Library", collaborator: "Web Developer"),
    Post(title: "Hackathon Brainstorming Session", description: "Generating ideas for hackathon.", date: "20 June 2024", time: "1 pm - 3 pm", location: "University Lab", collaborator: "Team Members"),
//    Post(title: "Business Plan Presentation", description: "Presenting our business plan to potential investors.", date: "25 June 2024", time: "2 pm - 4 pm", location: "Conference Hall", collaborator: "Business Advisor"),
    Post(title: "Building chat feature of AI tool", description: "Brief", date: "June 15, 2024", time: "10 am - 6 pm", location: "BL/link", collaborator: "UI designer"),
    Post(title: "App Development Sprint", description: "Working on new app features.", date: "5 July 2024", time: "3 pm - 5 pm", location: "Room 202", collaborator: "App Developer"),
//    Post(title: "Client Feedback Session", description: "Gathering feedback from our first batch of users.", date: "10 July 2024", time: "11 am - 1 pm", location: "Client Office", collaborator: "Client Relations"),
//    Post(title: "Team Building Activity", description: "Activities to strengthen team bonding.", date: "15 July 2024", time: "1 pm - 4 pm", location: "Outdoor Area", collaborator: "HR Team"),
//    Post(title: "Budget Planning Meeting", description: "Planning the budget for the next quarter.", date: "20 July 2024", time: "9 am - 11 am", location: "Finance Office", collaborator: "Finance Team"),
//    Post(title: "Technical Workshop", description: "Workshop on the latest technology trends.", date: "25 July 2024", time: "2 pm - 6 pm", location: "Tech Lab", collaborator: "Tech Team"),
    Post(title: "Launching Conference Tech Week", description: "Creating London Teen Startup Society", date: "30 July 2024", time: "10 am - 2 pm", location: "Event Hall", collaborator: "Marketing Team")
]
//can add start date and start time later
// make fields appropriate input -> calender  dropdown for date, 
