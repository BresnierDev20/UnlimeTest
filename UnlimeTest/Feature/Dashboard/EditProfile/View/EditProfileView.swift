//
//  EditProfileView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import SwiftUI

struct EditProfileView: View {
    @StateObject var viewModel: EditProfileViewViewModel = .init()
    @Environment(\.presentationMode) private var presentation
    
    var body: some View {
        VStack {
            NavigationBar(style: .editProfile, onBack: {
                presentation.wrappedValue.dismiss()
                
            }, onSave: {
                
            })
              .background(Color.hsBlue)
            
            VStack(alignment: .leading) {
                Divider()
                    .frame(height: 1)
                    .background(Color.black.opacity(0.5))
                
                HStack {
                    Spacer()
                    Circle()
                        .fill(Color.white)
                        .frame(width: 90, height: 90)
                    Spacer()
                }
                .padding()
            }
            .frame(height: 130)
            .frame(maxWidth: .infinity)
            .background(Color.hsBlue)
            .clipShape(CustomCorner(corners: [.bottomLeft, .bottomRight], size: 30))
            .padding(.top, -10)
 
            VStack(alignment: .leading, spacing: 16) {
                InputField(text: "Nombre", value: $viewModel.name , description: "", isFieldSelected:   viewModel.isNameSelected, isSelectd: true, onTapGesture: {
                    viewModel.isNameSelected = true
                    viewModel.isPhoneSelected = false
                    viewModel.isEmailSelected = false
                    viewModel.isDocumentSelected = false
                    
                },onTapSelect: {
                    viewModel.isNameSelected = false
                }, colorTxField: .white, visibilityIcon: false)

                InputField(text: "Email", value: $viewModel.email , description: "", isFieldSelected: viewModel.isEmailSelected, isSelectd: true, onTapGesture: {
                    viewModel.isNameSelected = false
                    viewModel.isPhoneSelected = false
                    viewModel.isEmailSelected = true
                    viewModel.isDocumentSelected = false
               
                },onTapSelect: {
                    viewModel.isEmailSelected = false
                }, colorTxField: .white, visibilityIcon: false)

                InputField(text: "Documento de identidad", value: $viewModel.documento , description: "", isFieldSelected: viewModel.isDocumentSelected, isSelectd: true, onTapGesture: {
                    viewModel.isNameSelected = false
                    viewModel.isPhoneSelected = false
                    viewModel.isEmailSelected = false
                    viewModel.isDocumentSelected = true
                    
                },onTapSelect: {
                    viewModel.isDocumentSelected = false
                }, colorTxField: .white, visibilityIcon: false)

                InputField(text: "Telefano", value: $viewModel.phone , description: "", isFieldSelected:  viewModel.isPhoneSelected, isSelectd: true, onTapGesture: {
                    viewModel.isNameSelected = false
                    viewModel.isPhoneSelected = true
                    viewModel.isEmailSelected = false
                    viewModel.isDocumentSelected = false
                    
                },onTapSelect: {
                    viewModel.isPhoneSelected = false
                }, colorTxField: .white, visibilityIcon: false)

                    Spacer()
                }
                .padding()
     
            Spacer()
                
        }
        .navigationBarHidden(true)
        .background(Color.hsWhiteLigth)
    }
}

#Preview {
    EditProfileView()
}
