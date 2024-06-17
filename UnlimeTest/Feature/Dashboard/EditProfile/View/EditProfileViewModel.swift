//
//  EditProfileViewModel.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import Foundation

class EditProfileViewViewModel : ObservableObject {
    @Published var name: String = "angea"
    @Published var email: String = "AngelberYOu4@gamil.com"
    @Published var documento: String = "128942"
    @Published var phone: String = "04125720232"
    
    @Published var isNameSelected = false
    @Published var isEmailSelected = false
    @Published var isPhoneSelected = false
    @Published var isDocumentSelected = false
    
}
