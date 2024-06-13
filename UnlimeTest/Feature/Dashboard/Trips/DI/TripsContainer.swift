//
//  TripsContainer.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import Factory

extension Container {
  var tripsCoordinator: Factory<TripsCoordinator> { self { TripsCoordinator() }.singleton }
}

