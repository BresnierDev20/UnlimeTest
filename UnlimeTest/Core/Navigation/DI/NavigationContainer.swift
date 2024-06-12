//
//  NavigationContainer.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 10/6/24.
//

import Factory
import Stinsen

extension Container {
  var mainCoordinator: Factory<MainCoordinator> { self { MainCoordinator() }.singleton }
  var mainNavigationCoordinator: Factory<MainNavigationCoordinator> { self { MainNavigationCoordinator() }.singleton }
}
