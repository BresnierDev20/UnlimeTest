//
//  HomeView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI


struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = .init()

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    Text("Discover")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, Constants.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: Constants.spacing) {
                            ForEach(viewModel.movieDt, id: \.self) { product in
                                DiscoverRowView(movie: product)
                                    .frame(width: 200, height: 250)
                                    .cornerRadius(10)
                            }
                        }.padding(.horizontal, Constants.horizontal)
                    }
                
                    Text("Popular")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, Constants.horizontal)
                    
                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(), spacing: Constants.spacing),
                            GridItem(.flexible(), spacing: Constants.spacing),
                        ],
                        spacing: Constants.spacing
                    ) {
                        ForEach(viewModel.movieDt, id: \.self) { data in
                            HomeRowView(data)
                                .frame(height: 180)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, Constants.horizontal)
//                .padding(.vertical, 20)
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
        static let horizontal: CGFloat = 4

    }
}

