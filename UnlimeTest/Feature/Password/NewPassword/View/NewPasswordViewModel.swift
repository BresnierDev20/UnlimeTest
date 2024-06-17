//
//  NewPasswordViewModel.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 15/6/24.
//

import Foundation

class NewPasswordViewModel : ObservableObject {
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
