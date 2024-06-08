//
//  NetworkView.swift
//  Buildr
//
//  Created by Kyna Jain on 07/06/24.
//

import SwiftUI

struct NetworkView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Network View")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                // Add your NetworkView content here
            }
            .navigationTitle("Network")
        }
    }
}

#Preview {
    NetworkView()
}
