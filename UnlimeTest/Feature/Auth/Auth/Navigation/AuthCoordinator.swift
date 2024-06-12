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
  
    var homeCoordinator = Container.shared.homeCoordinator()
    
    @Route(.push) var signup = makeSignUp
    @Route(.push) var login = makeLogin
    @Route(.push) var home = makeHome
}

extension AuthCoordinator {
    func makeHome() -> HomeCoordinator {
        return homeCoordinator
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
}
