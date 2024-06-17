//
//  ChangePasswordView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 15/6/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @Environment(\.presentationMode) private var presentation
    @EnvironmentObject var coordinator: AuthCoordinator.Router
    
    @StateObject var viewModel: ChangePasswordViewModel = .init()
    
    var body: some View {
        VStack() {
            NavigationBar(style: .signUp, onBack: {
                presentation.wrappedValue.dismiss()
            })
             .background(Color.clear)
        
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Text("¿Olvidaste")
                    Text("tu contraseña?")
                }
                .customFont(.bold, size: 38)
              
                Text("Ingresa el email con el que te registrates y te envierame un correo para que puedas acceder a tu cuenta")
                    .customFont(.bold, size: 20)
                    .padding(.top,12)
                
                
                InputField(text: "Email", value: $viewModel.email , description: "Enter your name", isFieldSelected: viewModel.isEmailSelected, isSelectd: true, onTapGesture: {
                        viewModel.isEmailSelected = true
                }, onTapSelect: {
                    viewModel.isEmailSelected = false
                }, colorTxField: .hsLightBlue, visibilityIcon: true)
               
                
                Button(action: {
                    presentation.wrappedValue.dismiss()

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        coordinator.route(to: \.newPassword)
                    }
                }) {
                    Text("Enviar")
                        .customFont(.bold, size: 18)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                }
                .filledStyle(isDisabled: true, colorIsEnable: .hsBlue, colorIsDisabled: .hsBlue.opacity(0.8))
                .padding(.top,20)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    ChangePasswordView()
}
