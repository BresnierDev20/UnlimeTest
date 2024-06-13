//
//  AccountContainer.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import Factory

extension Container {
  var accountCoordinator: Factory<AccountCoordinator> { self { AccountCoordinator() }.singleton }
}
