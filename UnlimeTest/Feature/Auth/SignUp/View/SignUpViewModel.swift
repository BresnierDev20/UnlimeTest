//
//  SignUpView.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

class SignUpViewModel : ObservableObject {
    @Published var loginError: Bool = false
    @Published var showPassword = false
    @Published var showConfirmPassword = false
    @Published var isTextValid = false
    @Published var isSecurySelected = false
    @Published var isEmailSelected = false
    @Published var email : String = "" {
        didSet {
            buttonEnable()
        }
    }
    
    @Published var password: String = "" {
       didSet {
           buttonEnable()
       }
    }
    
    @Published var confirmPassword: String = "" {
        didSet {
            buttonEnable()
        }
    }
    
     func buttonEnable() {
         if password.count >= 8 && confirmPassword.count >= 8 && email.count > 0 {
            isTextValid = true
           
        } else {
            isTextValid = false
        }
    }
}
