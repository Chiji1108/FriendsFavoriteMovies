//
//  MovieDetail.swift
//  FriendsFavoriteMovies
//
//  Created by 千々岩真吾 on 2025/01/27.
//

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    let isNew: Bool

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }

    var sortedFriends: [Friend] {
        movie.favoritedBy.sorted { $0.name < $1.name }
    }

    var body: some View {
        Form {
            TextField("Title", text: $movie.title)
                .autocorrectionDisabled()
            DatePicker("Release Date", selection: $movie.releaseDate, displayedComponents: .date)

            if !movie.favoritedBy.isEmpty {
                Section("Favorited By") {
                    ForEach(sortedFriends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle(isNew ? "New Movie" : "Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        context.insert(movie)
                        dismiss()
                    }
                    .disabled(movie.title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}

#Preview("New Movie") {
    NavigationStack {
        MovieDetail(movie: Movie(title: "", releaseDate: .now), isNew: true)
    }
}
