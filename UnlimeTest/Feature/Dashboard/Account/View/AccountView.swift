//
//  ProfileView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var coordinator: AccountCoordinator.Router
    @StateObject var viewModel: AccountViewViewModel = .init()
    @Environment(\.presentationMode) private var presentation
    
    var body: some View {
        VStack {
            NavigationBar(style: .account, onBack: {
                presentation.wrappedValue.dismiss()
            }, onEdit: {
                coordinator.route(to: \.edit)
            })
                .background(Color.hsBlue)
            
            VStack(alignment: .leading) {
                Divider()
                    .frame(height: 1)
                    .background(Color.black.opacity(0.5))
                
                HStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 75, height: 75)
                    
                    VStack(alignment: .leading) {
                        Text("Hola de nuevo,")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Text("Juan Rodriguez velazque")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack {
                            Image(.iconEmail)
                                .resizable()
                                .frame(width: 15, height: 10)
                                .foregroundColor(.white)
                            
                            Text("rodriguez@gmail")
                                .customFont(.extraLight, size: 12)
                        }
                        .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()
            }
            .frame(height: 130)
            .frame(maxWidth: .infinity)
            .background(Color.hsBlue)
            .clipShape(CustomCorner(corners: [.bottomLeft, .bottomRight], size: 30))
            .padding(.top, -10)
 
            List {
                ForEach(viewModel.sections) { section in
                    Section(header: HeaderProfileView(title: section.title, action: {
                        
                    })) {
                        ForEach(section.items, id: \.self) { item in
                            Button(action: {
                                //coordinator.route(to: \.signup)
                            }) {
                                AccountRowView(title: item)
                            }
                        }
                    }
                }
            }
            .background(Color.hsWhiteLigth)
            .scrollContentBackground(.hidden)
     
            Spacer()
                
            Button(action: {
                viewModel.logout()
            }) {
                Text("Cerrar Sesión")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                   
            }
            .filledStyle(isDisabled: true, colorIsEnable: .white, colorIsDisabled: .white)
            .padding()
        }
        .background(Color.hsWhiteLigth)
    }
}

#Preview {
    AccountView()
}
