//
//  MainView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import SwiftUI
import Factory

struct MainView: View {
    var startCoordinator = Container.shared.homeCoordinator()
    var tripsCoordinator = Container.shared.tripsCoordinator()
    var accountCoordinator = Container.shared.accountCoordinator()
   
    @State var currenTab: Tab = .start
   
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ZStack(alignment: .trailing) {
                    VStack(spacing: 0) {
                      switch currenTab {
                      case .start:
                          startCoordinator.view()
                      case .trips:
                          tripsCoordinator.view()
                          .background(.white)
                      case .account:
                          accountCoordinator.view()
                      default:
                        EmptyView()
                      }
                        TabBarView(currentTab: $currenTab)
                    }
                }
                .safeAreaInset(edge: .top) {
                  Color.clear.frame(height: geo.safeAreaInsets.top)
                }
                .edgesIgnoringSafeArea(.top)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

extension MainView {
  class Constants {
    static let opacity: CGFloat = 0
    static let sizeTabs : CGFloat = 32
    static let height: CGFloat = 120
    static let offsetY: CGFloat = 40
    static let cornerRadius: CGFloat = 30
    static let minimumDistance: CGFloat = 10
  }
}

#Preview {
    MainView()
}
