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
        ZStack {
            Image("launch")
                .resizable()
                .clipped()
            
            VStack {
                Spacer()
                
                VStack {
                    VStack{
                        Button(action: {
                            // Acción para iniciar sesión con Google
                        }) {
                            HStack {
                                Image(Images.ic_apple)
                                
                                Text("Inicia sesión con Apple")
                                    .customFont(.bold, size: 14)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .filledStyle(isDisabled: true, colorIsEnable: .hsLightBlue, colorIsDisabled: .hsLightBlue)
                     
                        Button(action: {
                            // Acción para iniciar sesión con Google
                        }) {
                            HStack {
                                Image(Images.ic_facebook)
                                
                                Text("Inicia sesión con Facebook")
                                    .customFont(.bold, size: 14)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .filledStyle(isDisabled: true, colorIsEnable: .hsLightBlue, colorIsDisabled: .hsLightBlue)
                        
                        Button(action: {
                            // Acción para iniciar sesión con Google
                        }) {
                            HStack {
                                Image(Images.ic_google)
                                
                                Text("Inicia sesión con Google")
                                    .customFont(.bold, size: 14)
                                    .foregroundColor(.black)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        .filledStyle(isDisabled: true, colorIsEnable: .hsLightBlue, colorIsDisabled: .hsLightBlue)
                        
                        SingUpDivider(label: "Or")
                        
                        Button(action: {
                            coordinator.route(to: \.signup)
                        }) {
                            Text("Crear cuenta")
                                .customFont(.bold, size: 18)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .filledStyle(isDisabled: true, colorIsEnable: .hsBlue, colorIsDisabled: .hsBlue.opacity(0.8))
                        
                        VStack {
                            Text("¿Ya tienes una cuenta?")
                                .padding(.bottom, Constants.paddingBottom)
                            
                            Button(action: {
                                coordinator.route(to: \.login, .init(email: "", password: ""))
                            }) {
                                Text("Iniciar Sesión")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.top, Constants.paddingTop)
                    }
                    .padding()
                }
                .frame(height: Constants.containerHeigth)
                .background(Color.white)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], size: Constants.clipShapeSize))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

extension AuthView {
    class Constants {
        static let containerHeigth: CGFloat = 450
        static let clipShapeSize: CGFloat = 30
        static let paddingTop: CGFloat = 20
        static let paddingBottom: CGFloat = 8
    }
}


#Preview {
    AuthView()
}
