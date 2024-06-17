//
//  ChangePasswordViewModel.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 15/6/24.
//

import SwiftUI

class ChangePasswordViewModel : ObservableObject {
    @Published var isTextValid = false
    @Published var isEmailSelected = false
    @Published var email : String = ""
}
