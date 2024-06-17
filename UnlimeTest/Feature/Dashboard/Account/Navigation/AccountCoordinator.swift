//
//  AccountCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import Stinsen
import Factory
import SwiftUI

final class AccountCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \AccountCoordinator.start)
    
    @Root var start = makeStart
    @Route(.push) var edit = makeEditProfile
  
}

extension AccountCoordinator {
    @ViewBuilder func makeStart() -> some View {
        AccountView()
    }
    
    @ViewBuilder func makeEditProfile() -> some View {
        EditProfileView()
    }
}
