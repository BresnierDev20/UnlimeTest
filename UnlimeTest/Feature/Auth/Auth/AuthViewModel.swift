//
//  AuthViewModel.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

class AuthViewViewModel : ObservableObject {
    @Published var isButtonEnabled = false
    @Published var goToLogin: Bool = false
    @Published var goToSing: Bool = false
}
