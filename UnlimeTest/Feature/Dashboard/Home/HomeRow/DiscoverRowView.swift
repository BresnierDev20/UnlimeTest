//
//  DiscoverView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 9/6/24.
//

import SwiftUI
import Kingfisher

struct DiscoverRowView: View {
    let movie: Results

    var body: some View {
        VStack {
            
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path ?? "")"))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
        }
    }
}
