//
//  NewPasswordView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 15/6/24.
//

import SwiftUI

struct NewPasswordView: View {
    @Environment(\.presentationMode) private var presentation
    @EnvironmentObject var coordinator: AuthCoordinator.Router
    
    @StateObject var viewModel: NewPasswordViewModel = .init()
    
    var body: some View {
        VStack() {
            NavigationBar(style: .signUp, onBack: {
                presentation.wrappedValue.dismiss()
            })
        
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("¿Olvidaste")
                    Text("tu contraseña?")
                }
                .customFont(.bold, size: 38)
                .padding(.bottom, 12)
              
                Text("Tu nueva contraseña debe ser diferente a la contraseña anterior")
                   
                InputField(text: "Email", value: $viewModel.email , description: "Enter your name", isFieldSelected: viewModel.isEmailSelected, isSelectd: true, onTapGesture: {
                        viewModel.isEmailSelected = true
                }, onTapSelect: {
                    viewModel.isEmailSelected = false
                }, colorTxField: .hsLightBlue, visibilityIcon: true)
              
                password
                
                Button(action: {
                    coordinator.route(to: \.confirmation)
                   
                }) {
                    HStack {
                        Text("Enviar")
                            .customFont(.bold, size: 18)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                }
                .filledStyle(isDisabled: viewModel.isTextValid, colorIsEnable: .hsBlue, colorIsDisabled: .hsBlue.opacity(0.8))
                .padding(.top,20)
                
                Spacer()
                
            }.padding()
        }
        .ignoresSafeArea(.keyboard)
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
          title: "Confirm Password",
          description: "Confirma tu nueva contraseña",
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
      }.padding(.bottom, 30)
    }
}

#Preview {
    NewPasswordView()
}
