//
//  HomeView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()
    @Environment(\.presentationMode) private var presentation
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Discover")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: Constants.spacing) {
//                            ForEach(viewModel.movieDt, id: \.self) { product in
//                                DiscoverRowView(movie: product)
//                                    .cornerRadius(10)
//                            }
//                        }
//                    }
                    
                    Text("Popular")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    LazyVGrid(columns:
                                UTSettings.current.columnsCompact) {
                        ForEach(viewModel.movieDt, id: \.self) { data in
                            HomeRowView(data)
                        }
                    }
                }
                .padding(.horizontal, Constants.horizontal)
            }
            Spacer()
        }
        .onAppear {
            viewModel.getMovie(page: viewModel.currentPage)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationBarHidden(true)
        .customNavigationBar(title: "Home", showBackButton: false, showNavBar: false, onBack: {})
    }
}

extension HomeView {
    class Constants {
        static let spacing: CGFloat = 20
        static let horizontal: CGFloat = 90
    }
}

