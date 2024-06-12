//
//  ContentView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel: AuthViewViewModel = .init()
    @EnvironmentObject var coordinator: AuthCoordinator.Router
    
    var body: some View {
//        NavigationView {
            ZStack {
                Image(Images.backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(Images.logo)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom,Constants.imagesBottom)
                        .frame(width: Constants.imagesnWidth, height: Constants.imagesHeigth)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("Discover the world of cinema with MovieMania. The world's largest movie streaming platform is now on your mobile device. Explore and enjoy now!")
                                .customFont(.extraLight, size: 14)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                        .frame(width: 450)
                        
                        Button(action: {
                            coordinator.route(to: \.signup)
                        }) {
                            HStack {
                                Text("Sign in")
                                    .customFont(.medium, size: 18)
                            }
                            .frame(width: 340, height: 50)
                        }
                        .padding()
                        .filledStyle(isDisabled: true)
                        
                        Button(action: {
                            coordinator.route(to: \.login, .init(email: "", password: ""))
                        }) {
                            HStack {
                                Text("Login")
                                    .customFont(.medium, size: 16)
                                
                            }
                            .frame(width: Constants.textLoginWidth, height: Constants.textLoginHeigth)
                            
                        }.filledStyle(isDisabled: true)
                    }.padding(.bottom,12)
                }
            }
//        }
    }
}

extension AuthView {
    class Constants {
        static let imagesBottom: CGFloat = 60
        static let imagesnWidth: CGFloat = 200
        static let imagesHeigth: CGFloat = 200
        static let textLoginWidth: CGFloat = 340
        static let textLoginHeigth: CGFloat = 50
    }
}


#Preview {
    AuthView()
}
