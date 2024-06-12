//
//  AuthContainer.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Factory

extension Container {
  var authCoordinator: Factory<AuthCoordinator> { self { AuthCoordinator() }.singleton }
}
