//
//  NotificationView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 17/6/24.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack {
            Image("launch")
                .resizable()
                .clipped()
            
            VStack {
                Spacer()
                
                VStack {
                    VStack{
                        Text("Quieres recibir Notificaciones")
                            .foregroundColor(.titleBlue)
                            .customFont(.bold, size: 30)
                            .padding(.bottom,8)
                
                        Text("Ingresa el email con el que te registrates y te envierame un correo para que puedas acceder a tu cuenta")
                            .customFont(.bold, size: 16)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.bottom,16)
                    
                        Button(action: {

                        }) {
                            HStack {
                                Text("Recibir Notificaciones")
                                    .customFont(.bold, size: 18)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                            }
                        }
                        .filledStyle(isDisabled: true, colorIsEnable: .hsBlue, colorIsDisabled: .hsBlue.opacity(0.5))
                        .padding(.bottom,12)
                        
                        Text("No, gracias")
                            .customFont(.bold, size: 18)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                        
                        Spacer()
                    }
                    .padding()
                }
                .frame(height: 400)
                .background(Color.white)
                .clipShape(CustomCorner(corners: [.topLeft, .topRight], size: 30))
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    NotificationView()
}
