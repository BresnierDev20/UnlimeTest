//
//  NavigationBar.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

struct NavigationBar: ViewModifier {
    var title: String
    var showBackButton: Bool
    var showNavBarSingUP: Bool
    var onBack: (() -> Void)?
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            if showNavBarSingUP  {
                HStack {
                    Button(action: {
                        onBack?()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15,height: 15)
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.vertical,12)
                .background(Color.clear)
                content
            }else {
                HStack {
                    if showBackButton {
                        Button(action: {
                            onBack?()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    
                    Spacer()
                    
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical,12)
                .background(Color.black.opacity(0.8))
                content
            }
        }
    }
}
extension View {
    func customNavigationBar(title: String, showBackButton: Bool = false, showNavBar: Bool = false, onBack: (() -> Void)? = nil) -> some View {
        self.modifier(NavigationBar(title: title, showBackButton: showBackButton, showNavBarSingUP: showNavBar, onBack: onBack))
    }
}
