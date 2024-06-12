//
//  MainNavigationCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 10/6/24.
//


import Stinsen
import SwiftUI
import Factory

final class MainNavigationCoordinator: NavigationCoordinatable {
  let stack = NavigationStack(initial: \MainNavigationCoordinator.start)

  var mainCoordinator = Container.shared.mainCoordinator()
  @Root var start = makeStart
 
  func makeStart() -> NavigationViewCoordinator<MainCoordinator> {
    return NavigationViewCoordinator(mainCoordinator)
  }
    
  deinit {
    print("Deinit Main")
  }
    
}
