//
//  SignUpView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel = .init()
    @Environment(\.presentationMode) private var presentation
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading)  {
                NavigationLink("", isActive: $viewModel.goToLogin, destination: {
                                   LoginView(initialEmail: viewModel.email, initialPassword: viewModel.password)
                               })
                
                HStack {
                    Spacer()
                    
                    Image(Images.logo)
                    
                    Spacer()
                }
                .padding()
              
                VStack(alignment: .leading) {
                    Text("Sign up")
                        .customFont(.bold, size: 30)
                        .padding(.bottom,4)
                    
                    SingUpDivider(label: "Or Sing Up with")
                }
                .foregroundColor(.white)
                .padding()

                VStack{
                    InputField(text: "Email", value: $viewModel.email , description: "Enter your Email", isFieldSelected: viewModel.isEmailSelected, isSelectd: true, onTapGesture: {
                            viewModel.isEmailSelected = true
                            viewModel.isSecurySelected = false
                    }, onTapSelect: {
                        viewModel.isEmailSelected = false
                    })
                    password
                    
                    confirmPassword
                   
                    Button(action: {
                        if viewModel.password == viewModel.confirmPassword {
                            viewModel.goToLogin = true
                        }else {
                            viewModel.loginError = true
                        }
                    }) {
                        HStack {
                            Text("Register")
                                .customFont(.medium, size: 18)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                    }
                   
                    .padding(.top,62)
                    .filledStyle(isDisabled: viewModel.isTextValid)
                }
                .padding(20)
                
                Spacer()
            }
           
        }
        .customNavigationBar(title: "", showBackButton: true, showNavBar: true) {
        presentation.wrappedValue.dismiss()
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
      }
    }
    
    var confirmPassword: some View {
      VStack{
        InputSecureField(
          password: $viewModel.confirmPassword,
          showPassword: viewModel.showConfirmPassword,
          isTextValid: viewModel.isTextValid,
          isSecurySelected: viewModel.isSecurySelected,
          forgotPassword: false,
          title: "Confirm your password",
          description: "Enter password",
          txtMessages: "",
          onFieldTapGesture: {
            viewModel.isEmailSelected = false
            viewModel.isSecurySelected = true
          },
          onButtonTapGesture: {
            viewModel.showConfirmPassword.toggle()
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
      }
    }
}

#Preview {
    SignUpView()
}
