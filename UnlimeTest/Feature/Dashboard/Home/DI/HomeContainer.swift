//
//  homeCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Factory

extension Container {
  var homeCoordinator: Factory<HomeCoordinator> { self { HomeCoordinator() }.singleton }
}
