//
//  FilteredMovieList.swift
//  FriendsFavoriteMovies
//
//  Created by 千々岩真吾 on 2025/01/27.
//

import SwiftUI

struct FilteredMovieList: View {
    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            MovieList(titleFilter: searchText)
                .searchable(text: $searchText)
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FilteredMovieList()
        .modelContainer(SampleData.shared.modelContainer)
}
