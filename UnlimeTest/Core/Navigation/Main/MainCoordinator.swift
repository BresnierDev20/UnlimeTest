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
    var homeCoordinator = Container.shared.homeCoordinator()
    
    @Root var start = makeAuth
    
}

extension MainCoordinator {
  func makeAuth() -> some View {
      if Container.datastore.getUserKey() {
          return AnyView(homeCoordinator.view())
      }else {
          return AnyView(authCoordinator.view())
      }
  }
}
