//
//  HomeRowView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI
import Kingfisher

struct HomeRowView: View {
    let movie: Results

    init(_ movie: Results) {
      self.movie = movie
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string:"https://image.tmdb.org/t/p/w500/\(movie.poster_path ?? "")"))
                .resizable()
                .frame(height: 200)
           
           VStack(alignment: .leading) {
               Text("CATEGORY NAME")
                   .font(.caption)
                   .foregroundColor(.gray)
               
               Text(movie.title ?? "Loadding")
                   .font(.headline)
                   .foregroundColor(.primary)
                   .lineLimit(1)
               
               Text("Subtitle explaining the origins of the app, maybe a nice story or something else. 2 lines")
                   .font(.subheadline)
                   .foregroundColor(.secondary)
                   .lineLimit(2)
           }
           .padding([.leading, .bottom, .trailing])
        }
        .frame(width: 200)
        .cornerRadius(20)
    }
}

extension HomeRowView {
    class Constants {
        static let imagenHeigth: CGFloat = 190
        static let UnevenRoundedRectangleRadius: CGFloat = 8
        static let UnevenRoundedRectangleHeigth: CGFloat = 100
        static let titleWidth: CGFloat = 100
        static let clipShapeCornerRadius: CGFloat = 12
    }
}
