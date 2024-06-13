//
//  TripsCoordinator.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import Stinsen
import Factory
import SwiftUI

final class TripsCoordinator: NavigationCoordinatable {
    let stack = NavigationStack(initial: \TripsCoordinator.start)
    
    @Root var start = makeStart
  
}

extension TripsCoordinator {
    @ViewBuilder func makeStart() -> some View {
        TripsView()
    }
}
