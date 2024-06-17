//
//  PasswordConfirmationView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 15/6/24.
//

import SwiftUI

struct PasswordConfirmationView: View {
    @StateObject var viewModel: PasswordConfirmationViewModel = .init()
    @EnvironmentObject var coordinator: AuthCoordinator.Router
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .center, spacing: 15) {
                VStack {
                    Text("Constraseña")
                    Text("Cambiada")
                }
                .customFont(.bold, size: 38)
                .padding(.bottom,8)
             
                Text("Has cambiado tu contraseña correctamente. ahora puedes iniciar seccion con tu nueva contraseña")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,6)
                
                Button(action: {
                    coordinator.route(to: \.login, .init(email: "", password: ""))
                    
                }) {
                    Text("Iniciar sesion")
                        .customFont(.bold, size: 18)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                }
                .filledStyle(isDisabled: true, colorIsEnable: .hsBlue, colorIsDisabled: .hsBlue.opacity(0.8))
                .padding(.top,20)
            }
            Spacer()
        }
        .navigationBarHidden(true)
        .padding()
    }
}
