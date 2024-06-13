//
//  NavigationBar.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

struct NavigationBar: View {
    var showNavBarSingUP: Bool
    var onBack: (() -> Void)?
    
    var body: some View {
        VStack {
            if showNavBarSingUP  {
                HStack {
                    Button(action: {
                        onBack?()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.vertical, 12)
                .background(Color.clear)
            }else {
                HStack {
                    Spacer()
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .onTapGesture {}
                }
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
    }
}
