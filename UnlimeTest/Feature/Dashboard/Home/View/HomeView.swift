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
        NavigationBar(style: .profile, onBack: {})
        .frame(maxWidth: .infinity)
      
        VStack(alignment: .leading) {
            Text("Descubre")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 16)
            
            HStack {
                Text("To Margarita (Destacado)")
                    .font(.headline)
                    .foregroundColor(.primary)

                Spacer()

                Button(action: {
                    // Acción para ver todo
                }) {
                    Text("Ver todo")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .underline()
                        .padding(.trailing, 16)
                }.padding(.trailing, 8)
            }
         
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: UTSettings.current.rows, spacing: 10) {
                    ForEach(viewModel.movieDt, id: \.self) { data in
                        HomeRowView(data)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getMovie(page: viewModel.currentPage)
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

extension HomeView {
    class Constants {
        static let spacing: CGFloat = 20
        static let horizontal: CGFloat = 90
    }
}
