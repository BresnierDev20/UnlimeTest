//
//  AuthService.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Combine
import Foundation

//class AuthService: ObservableObject {
//    private let isAuthenticatedKey = "isAuthenticated"
//
//    @Published var isAuthenticated: Bool {
//        didSet {
//            UserDefaults.standard.set(isAuthenticated, forKey: isAuthenticatedKey)
//        }
//    }
//    
//    init() {
//        self.isAuthenticated = UserDefaults.standard.bool(forKey: isAuthenticatedKey)
//    }
//    
//    func logIn(token: String) {
//        UserDefaults.standard.set(token, forKey: apiTokenKey)
//        isAuthenticated = true
//    }
//    
//    func logOut() {
//        UserDefaults.standard.removeObject(forKey: apiTokenKey)
//        isAuthenticated = false
//    }
//}
