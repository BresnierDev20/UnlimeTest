//
//  SignUpView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel = .init()
    @Environment(\.presentationMode) private var presentation
    
    var initialEmail: String
    var initialPassword: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading)  {
                NavigationLink(destination: HomeView(), isActive: $viewModel.goToHome){}
                NavigationLink(destination: SignUpView(), isActive: $viewModel.goToSingUp){}
                
                HStack {
                    Spacer()
                    
                    Image(Images.logo)
                    
                    Spacer()
                }.padding()
              
                VStack(alignment: .leading) {
                    Text("Login")
                        .customFont(.bold, size: 30)
                        .padding(.bottom,4)
                    
                    Text("Enter your credentials to continue.")
                        .customFont(.bold, size: 16)
                }
                .foregroundColor(.white)
                .padding()

                VStack{
                    InputField(text: "Email", value: $viewModel.email , description: "Enter your email", isFieldSelected: viewModel.isEmailSelected, isSelectd: true,
                               onTapGesture: {
                                viewModel.isEmailSelected = true
                                viewModel.isSecurySelected = false
                    }, onTapSelect: {
                                                viewModel.isEmailSelected = false
                    })
                    
                    password
                    
                    SingUpDivider(label: "Or")
                    
                    Button(action: {
                        if viewModel.password == initialPassword &&  viewModel.password == initialEmail {
                            
                            viewModel.goToHome = true
                        }else {
                            viewModel.loginError = true
                        }
                    }) {
                        HStack {
                            Text("Login")
                                .customFont(.medium, size: 18)
                                .frame(maxWidth: .infinity)
                                .frame(height: 70)
                        }
                    }
                    .padding(.top,12)
                    .filledStyle(isDisabled: viewModel.isTextValid)
                    
                    HStack(spacing: 4) {
                      Spacer()
                      Text("You do not have an account?")
                        .customFont(.semiBold, size: 16)
                        .foregroundColor(.white)

                      Text("Sign up")
                        .customFont(.semiBold, size: 16)
                        .foregroundColor(.backgroundRed)
                        .onTapGesture {
                            viewModel.goToSingUp = true
                        }
                      Spacer()
                    }
                    .padding(.top, 12)
                    
                }.padding()
                
                Spacer()
            }.customNavigationBar(title: "", showBackButton: true, showNavBar: true) {
                presentation.wrappedValue.dismiss()
            }
        }
        .background(Color.black)
        .navigationBarHidden(true)
       
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
                .foregroundColor(Color.backgroundRed)
                .onTapGesture {}
          }
        }
      }.padding(.bottom, 30)
    }
}

#Preview {
    SignUpView()
}
