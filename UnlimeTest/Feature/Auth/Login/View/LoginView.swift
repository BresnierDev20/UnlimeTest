//
//  SignUpView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI
import Factory
import Stinsen

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var size: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}

struct LoginView: View {
    @Environment(\.presentationMode) private var presentation
    @EnvironmentObject var coordinator: AuthCoordinator.Router
    @StateObject var viewModel: LoginViewModel = .init()
    
    var navigationData: NavigationData
    
    var body: some View {
      
        ZStack {
            Image("launch")
                .resizable()
                .clipped()
            
            VStack {
                NavigationBar(style: .signUp, onBack: {
                    presentation.wrappedValue.dismiss()
                })
                .padding(.top, 20)
                
                Spacer()
                
                VStack {
                    VStack{
                        Text("Inicia Sesión")
                            .foregroundColor(.titleBlue)
                            .customFont(.bold, size: 30)
                        
                        Spacer()
                        
                        InputField(text: "Email", value: $viewModel.email , description: "Enter your email", isFieldSelected: viewModel.isEmailSelected, isSelectd: true,onTapGesture: {
                                    viewModel.isEmailSelected = true
                                    viewModel.isSecurySelected = false
                        }, onTapSelect: {
                            viewModel.isEmailSelected = false
                            
                        }, colorTxField: .hsLightBlue, visibilityIcon: true, keyboardType: .emailAddress, textContentType: .emailAddress)
                        
                        password
                        
                        Button(action: {
//                            if viewModel.password == navigationData.password &&  viewModel.email == navigationData.email {
                                coordinator.route(to: \.home)
                                viewModel.datastore.storeUserKey(true)

//                            }else {
//                                viewModel.loginError = true
//                            }
                        }) {
                            HStack {
                                Text("Ingresar")
                                    .customFont(.bold, size: 18)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                            }
                        }
                        .filledStyle(isDisabled: viewModel.isTextValid, colorIsEnable: .hsBlue, colorIsDisabled: .hsDisable)
                        .padding(.top,12)
                        
                        Text("Forgot your password")
                            .foregroundColor(.hsBlue)
                            .font(.footnote)
                            .onTapGesture {
                                viewModel.isSheetPresented = true
                            }
                            .sheet(isPresented: $viewModel.isSheetPresented) {
                                ChangePasswordView()
                            }
                            .padding(.top,10)
                        
                        Spacer()
                        
                        VStack {
                            Text("¿Nuevo en Viaja Facil?")
                                .padding(.bottom, 8)
                                
                            Text("Crear cuenta")
                                .foregroundColor(.hsBlue)
                                .bold()
                                .onTapGesture {
                                    coordinator.route(to: \.signup)
                                }
                        }
                        Spacer()
                    }
                    .padding()
                }
                .frame(height: 550)
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
          title: "Confirm Password",
          description: "Enter password",
          txtMessages: "",
          onFieldTapGesture: {
            viewModel.isEmailSelected = false
            viewModel.isSecurySelected = true
          },
          onButtonTapGesture: {
            viewModel.showPassword.toggle()
          }, onChange: {},
          
          onFieldTapSelect: {
            viewModel.isSecurySelected = false
          })

        HStack {
          if viewModel.loginError {
            HStack {
              Image(Images.ic_failed)
                .resizable()
                .frame(width: 20, height: 20)

              Text("Incorrect password")
                .customFont(.semiBold, size: 12)
                .foregroundColor(.red)
                
              Spacer()
            }.padding(.leading, 4)
              
              Spacer()
                
              Text("Did you forget your password?")
                .customFont(.medium, size: 16)
                .onTapGesture {}
          }
        }
      }.padding(.bottom, 30)
    }
}

//#Preview {
//    ContentView()
//}
