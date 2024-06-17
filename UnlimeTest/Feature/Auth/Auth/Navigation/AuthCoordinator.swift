//
//  AuthCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Stinsen
import Factory
import SwiftUI

final class AuthCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AuthCoordinator.start)
    
    @Root var start = makeStart
 
    @Route(.push) var confirmation = makePasswordConfirmation
    @Route(.push) var signup = makeSignUp
    @Route(.push) var newPassword = makeNewPassWord
    @Route(.push) var login = makeLogin
    @Route(.push) var home = makeHome
    @Route(.modal) var modalChangePassword = makeModalScreen
}

extension AuthCoordinator {
    @ViewBuilder func makeNewPassWord() -> some View {
        NewPasswordView()
    }
    
    @ViewBuilder func makeHome() -> some View {
       MainView()
    }
    
    @ViewBuilder func makeStart() -> some View {
        AuthView()
    }
    
    @ViewBuilder func makeLogin(data: NavigationData) -> some View {
        LoginView(navigationData: data)
    }

    @ViewBuilder func makeSignUp() -> some View {
        SignUpView()
    }
    
    @ViewBuilder func makeModalScreen() -> some View {
        ChangePasswordView()
    }
    
    @ViewBuilder func makePasswordConfirmation() -> some View {
        PasswordConfirmationView()
    }
}
