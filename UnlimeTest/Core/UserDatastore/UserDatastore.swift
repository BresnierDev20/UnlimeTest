//
//  UserDatastore.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Foundation

class UserDatastore {
    private let userIDKey = "UserIDKey"
    
    //Get Token
    func storeUserKey(_ validation: Bool){
      UserDefaults.standard.set(validation, forKey: userIDKey)
    }

    func getUserKey() -> Bool {
      return UserDefaults.standard.bool(forKey: userIDKey)
    }

    func deleteUserKey() {
      UserDefaults.standard.removeObject(forKey: userIDKey)
    }
}
