//
//  NavigationBar.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI
 
enum NavigationBarStyle {
    case signUp
    case profile
    case account
    case editProfile
}

struct NavigationBar: View {
    var style: NavigationBarStyle
    var onBack: (() -> Void)?
    var onSave: (() -> Void)?
    var onEdit: (() -> Void)?
    
    var body: some View {
        VStack {
            switch style {
            case .signUp:
                HStack {
                    Button(action: {
                        onBack?()
                    }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.vertical, 12)
                .background(Color.clear)
            case .profile:
                HStack {
                    Spacer()
                    Image("profile")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .onTapGesture {}
                        .padding()
                }
            case .account:
                HStack {
                    Button(action: {
                        onBack?()
                    }) {
                        HStack{
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                               
                               
                            Text("Atras")
                                .customFont(.semiBold, size: 14)
                                .foregroundColor(.white)
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                    
                    Spacer()
                    
                    Text("Mi cuenta")
                        .customFont(.bold, size: 16)
                        .foregroundColor(.white)
                    
                    Spacer()
                   
                    
                    Text("Editar")
                        .customFont(.semiBold, size: 14)
                        .foregroundColor(.white)
                        .padding()
                        .onTapGesture {
                            onEdit?()
                        }
                }
            case .editProfile:
                HStack {
                    Button(action: {
                        onBack?()
                    }) {
                        HStack{
                            Image(systemName: "chevron.left")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                               
                            Text("Atras")
                                .customFont(.semiBold, size: 14)
                                .foregroundColor(.white)
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                    }
                    
                    Spacer()
                    
                    Text("Guardar")
                        .customFont(.semiBold, size: 14)
                        .foregroundColor(.white)
                        .padding()
                        .onTapGesture {
                            onSave?()
                        }
                }
            }
        }
    }
}
