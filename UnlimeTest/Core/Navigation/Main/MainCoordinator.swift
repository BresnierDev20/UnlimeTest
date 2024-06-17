//
//  MainCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 10/6/24.
//

import Stinsen
import SwiftUI
import Factory

final class MainCoordinator: NavigationCoordinatable {
  let stack = NavigationStack(initial: \MainCoordinator.start)
    
    var authCoordinator = Container.shared.authCoordinator()
    var dashboardCoordinator = Container.shared.dashboardCoordinator()
    
    @Root var start = makeAuth
    @Route(.push) var auth = makeAuth2
    @Route(.push) var auth2 = makeLogin
}

extension MainCoordinator {
  func makeAuth() -> some View {
      if Container.datastore.getUserKey() {
          return AnyView(MainView())
      }else {
          return AnyView(authCoordinator.view())
      }
  }
    
    func makeAuth2() -> AuthCoordinator {
      return authCoordinator
    }
    
    @ViewBuilder func makeLogin(data: NavigationData) -> some View {
        LoginView(navigationData: data)
    }
}
