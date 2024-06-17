//
//  LoginContainer.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 17/6/24.
//

import Factory

extension Container {
  var loginCoordinator: Factory<LoginCoordinator> { self { LoginCoordinator() }.singleton }
}

