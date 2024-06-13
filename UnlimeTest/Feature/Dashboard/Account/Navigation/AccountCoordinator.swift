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
  
}

extension AccountCoordinator {
    @ViewBuilder func makeStart() -> some View {
        AccountView()
    }
}
