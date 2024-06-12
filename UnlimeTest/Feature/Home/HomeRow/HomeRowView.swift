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
            KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.poster_path ?? "")"))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(Color.red)
        }
        .clipShape(RoundedRectangle(cornerRadius: Constants.clipShapeCornerRadius))
        .background(Color.clear)
        .overlay(alignment: .bottom) {
            UnevenRoundedRectangle(bottomLeadingRadius: Constants.UnevenRoundedRectangleRadius, bottomTrailingRadius: Constants.UnevenRoundedRectangleRadius)
                .frame(height: Constants.UnevenRoundedRectangleHeigth)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .leading, endPoint: .trailing))
            
            if let title = movie.title {
                Text(title)
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .customFont(.bold, size: 14)
                    .frame(width: Constants.titleWidth, alignment: .leading)
            }else {
                EmptyView()
            }
        }
    }
}

extension HomeRowView {
    class Constants {
        static let imagenHeigth: CGFloat = 190
        static let UnevenRoundedRectangleRadius: CGFloat = 8
        static let UnevenRoundedRectangleHeigth: CGFloat = 40
        static let titleWidth: CGFloat = 100
        static let clipShapeCornerRadius: CGFloat = 12
    }
}
