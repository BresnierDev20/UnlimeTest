//
//  UnlimeTestApp.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI
import Factory
import Stinsen

@main
struct UnlimeTestApp: App {
    var mainCoordinator = Container.shared.mainNavigationCoordinator()
    
    var body: some Scene {
        WindowGroup {
            mainCoordinator.view()
        }
    }
}
