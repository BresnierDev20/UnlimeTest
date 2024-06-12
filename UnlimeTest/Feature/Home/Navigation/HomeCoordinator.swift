//
//  HomeCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 11/6/24.
//

import Stinsen
import Factory
import SwiftUI

final class HomeCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \HomeCoordinator.start)
    
    @Root var start = makeStart
  
}

extension HomeCoordinator {
    @ViewBuilder func makeStart() -> some View {
        HomeView()
    }
}
