//
//  File.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import Stinsen
import SwiftUI
import Factory

final class DashboardCoordinator: TabCoordinatable {
  let child = TabChild(startingItems: [
    \DashboardCoordinator.trips,
    \DashboardCoordinator.start,
     \DashboardCoordinator.account,
  ])

  @Route(tabItem: makeStartTab) var start = makeStart
  @Route(tabItem: makeTripsTab) var trips = makeTrips
  @Route(tabItem: makeAccountTab) var account = makeAccount

  var homeCoordinator = Container.shared.homeCoordinator()
  var tripsCoordinator = Container.shared.tripsCoordinator()
  var accountCoordinator = Container.shared.accountCoordinator()
  

  func customize(_ view: AnyView) -> some View {
    return view.accentColor(.hsPrimaryBlue)
  }

  init() {
      UITabBar.appearance().unselectedItemTintColor = UIColor.white
  }
    
   
}

extension DashboardCoordinator {
    
    //HomeCoordinator
      @ViewBuilder func makeStartTab(isActive: Bool) -> some View {
        VStack {
          Image
            .fromSystem( isActive ? .start : .start)
            .renderIcon()
            .foregroundColor(.hsPrimaryBlue)
            
          Text("Start")
            .foregroundColor(.hsPrimaryBlue)
            .customFont(.regular, size: 12)
        }.environment(\.symbolVariants, .none)
      }

      func makeStart() -> HomeCoordinator {
        return homeCoordinator
      }
    
    //TripsCoordinator
      @ViewBuilder func makeTripsTab(isActive: Bool) -> some View {
        VStack {
          Image
                .fromSystem(isActive ? .trips : .trips)
            .badge(3)
          Text("Trips")
            .customFont(.regular, size: 12)
        }
        .environment(\.symbolVariants, .none)
      }

      func makeTrips() -> TripsCoordinator {
        return tripsCoordinator
      }

    //AccountCoordinator
      @ViewBuilder func makeAccountTab(isActive: Bool) -> some View {
        VStack {
          Image
            .fromSystem(isActive ? .account : .account)
            .badge(3)
          Text("Account")
            .customFont(.regular, size: 12)
        }
        .environment(\.symbolVariants, .none)
      }

      func makeAccount() -> AccountCoordinator{
        return accountCoordinator
      }
}
