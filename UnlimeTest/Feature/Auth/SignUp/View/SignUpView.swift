//
//  SignUpView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var coordinator: AuthCoordinator.Router
    @Environment(\.presentationMode) private var presentation
    
    @StateObject var viewModel: SignUpViewModel = .init()
    
    var body: some View {
      
        ZStack {
            Image("launch")
                .resizable()
                .clipped()
            
            VStack {
                NavigationBar(style: .signUp, onBack: {
                    presentation.wrappedValue.dismiss()
                })
                 .frame(maxWidth: .infinity)
                 .background(Color.clear)
                 .padding(.top, 8)
                
                Spacer()
                
                VStack {
                    VStack{
                        Text("Crear cuenta")
                            .foregroundColor(.titleBlue)
                            .customFont(.bold, size: 30)
                        
                        Spacer()
                        
                        InputField(text: "Nombre", value: $viewModel.name , description: "Enter your name", isFieldSelected: viewModel.isNameSelected, isSelectd: true, onTapGesture: {
                                viewModel.isNameSelected = true
                                viewModel.isSecurySelected = false
                                viewModel.isEmailSelected = false
                        }, onTapSelect: {
                            viewModel.isNameSelected = false
                        }, colorTxField: .hsLightBlue, visibilityIcon: true)
                        
                        InputField(text: "Email", value: $viewModel.email , description: "Enter your Email", isFieldSelected: viewModel.isEmailSelected, isSelectd: true, onTapGesture: {
                                viewModel.isNameSelected = false
                                viewModel.isSecurySelected = false
                                viewModel.isEmailSelected = true
                        }, onTapSelect: {
                            viewModel.isEmailSelected = false
                        }, colorTxField: .hsLightBlue, visibilityIcon: true)
                        
                        password
                        
                        Button(action: {
                             coordinator.route(to: \.login, .init(email: viewModel.email, password: viewModel.password))
                           
                        }) {
                            Text("Crear cuenta")
                                .foregroundColor(.white)
                                .customFont(.medium, size: 18)
                                .frame(maxWidth: .infinity)
                                .frame(height: 55)
                        }
                        .filledStyle(isDisabled: viewModel.isTextValid, colorIsEnable: .hsBlue, colorIsDisabled: .hsDisable)
                        .padding(.top,25)
                        
                        HStack {
                            Text("Al crear una cuenta aceptas nuestras")
                                .foregroundColor(.black)
                            
                            Text("politicas de privacidad")
                                .foregroundColor(.hsBlue)
                        }
                        .lineLimit(1)
                        .customFont(.light, size: 10)
                        
                        Spacer()
                        
                        VStack {
                            Text("¿Ya tienes una cuenta?")
                                .padding(.bottom, 8)
                                
                            
                            Text("Inicia Sesion")
                                .foregroundColor(.hsBlue)
                                .bold()
                                .onTapGesture {
                                    coordinator.route(to: \.login, .init(email: viewModel.email, password: viewModel.password))
                                }
                        }
                        .padding(.bottom,20)
                    }
                    .padding()
                }
                .frame(height: 600)
                .background(Color.white)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], size: 30))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
    
    var password: some View {
      VStack{
        InputSecureField(
          password: $viewModel.password,
          showPassword: viewModel.showPassword,
          isTextValid: viewModel.isTextValid,
          isSecurySelected: viewModel.isSecurySelected,
          forgotPassword: false,
          title: "Password",
          description: "Enter password",
          txtMessages: "",
          onFieldTapGesture: {
              viewModel.isNameSelected = false
              viewModel.isSecurySelected = true
              viewModel.isEmailSelected = false
          },
          onButtonTapGesture: {
            viewModel.showPassword.toggle()
              
          }, onChange: {},
          
          onFieldTapSelect: {
            viewModel.isSecurySelected = false
          })
      }
    }
}
