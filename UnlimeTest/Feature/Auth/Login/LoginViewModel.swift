//
//  SignUpViewModel.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

class LoginViewModel : ObservableObject {
    @Published var goToHome: Bool = false
    @Published var goToSingUp: Bool = false
    @Published var loginError: Bool = false
    @Published var showPassword = false
    @Published var isTextValid = true
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
   
    func buttonEnable() {
         if password.count >= 8 && email.count > 0 {
            isTextValid = true
          
        } else {
            isTextValid = false
        }
    }
}
