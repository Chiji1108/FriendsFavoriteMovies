//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by 千々岩真吾 on 2025/01/27.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie?

    init(name: String) {
        self.name = name
    }

    static let sampleData: [Friend] = [
        Friend(name: "Jim"),
        Friend(name: "Elena"),
        Friend(name: "Mia"),
        Friend(name: "Liam"),
        Friend(name: "Olivia"),
        Friend(name: "Noah"),
        Friend(name: "Emma"),
        Friend(name: "William"),
    ]
}
