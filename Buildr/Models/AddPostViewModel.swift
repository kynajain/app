//
//  AddPostViewModel.swift
//  Buildr
//
//  Created by Kyna Jain on 07/06/24.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}
