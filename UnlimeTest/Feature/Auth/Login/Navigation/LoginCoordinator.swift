//
//  LoginCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 17/6/24.
//

import Stinsen
import Factory
import SwiftUI

final class LoginCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \LoginCoordinator.start)
    
    @Root var start = makeStart
  
    var homeCoordinator = Container.shared.mainCoordinator()
    
}

extension LoginCoordinator {
    func makeNewPassWord() -> MainCoordinator {
        return homeCoordinator
    }
    
    @ViewBuilder func makeStart(data: NavigationData) -> some View {
        LoginView(navigationData: data)
    }
}
