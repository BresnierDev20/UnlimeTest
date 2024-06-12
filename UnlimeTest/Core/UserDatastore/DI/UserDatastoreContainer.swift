//
//  UserDatastoreContainer.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Factory

extension Container {
  static var datastore: UserDatastore { UserDatastore() }
}
