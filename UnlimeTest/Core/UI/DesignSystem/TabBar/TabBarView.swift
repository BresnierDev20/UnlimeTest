//
//  TabBarView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import SwiftUI
import Factory

struct TabBarView : View {
  @Binding var currentTab: Tab
 
  var body: some View {
      VStack {
          Divider()
          
          HStack(alignment: .center) {
            Button { withAnimation(.easeOut(duration: Constants.animationTime)) {
              currentTab = .start }
            } label: {
              VStack(spacing: Constants.spacingOne) {
                  Image(currentTab == .start ? "start_fill" : "start_fill")
                  .renderIcon()
                  .frame(width: Constants.iconSize , height: Constants.iconSize)
                 
                Text("Start")
                  .customFont(.regular, size: Constants.sizeTwelve)
              }
              .foregroundColor(currentTab == .start ? .hsPrimaryBlue : .gray)
            }
            .frame(maxWidth: .infinity)

            Button {
              withAnimation(.easeOut(duration: Constants.animationTime)) {
                currentTab = .trips
              }
            } label: {
              VStack(spacing: Constants.spacingOne) {
                Image(currentTab == .trips ? "trips_fill" : "trips_fill")
                  .renderIcon()
                  .frame(width: Constants.frameEighteen, height: Constants.frameEighteen)

                Text("Trips")
                  .customFont(.regular, size: Constants.sizeTwelve)
              }
              .foregroundColor(currentTab == .trips ? .hsPrimaryBlue : .gray)
            }
            .frame(maxWidth: .infinity)

            Button {
              withAnimation(.easeOut(duration: Constants.animationTime)) {
                currentTab = .account
              }
            } label: {
                VStack(spacing: Constants.spacingOne) {
                    Image(currentTab == .account ? "account_tab" : "account_tab")
                      .renderIcon()
                      .frame(width: Constants.frameTwentyThree)

                  Text("Account")
                    .customFont(.regular, size: Constants.sizeTwelve)
                }
                .foregroundColor(currentTab == .account ? .hsPrimaryBlue : .gray)
            }
            .frame(maxWidth: .infinity)
          }
          .background(.white)
          .foregroundColor(.hsPrimaryBlue)
          .padding(.bottom, Constants.paddingTwenty)
          .padding(.top, Constants.paddingFifteen)
      }
  }
}

extension TabBarView {
  class Constants {
    static let animationTime : CGFloat = 0.0
    static let iconSize: CGFloat = 20
    static let sizeTwelve : CGFloat = 12
    static let spacingOne : CGFloat = 1
    static let paddingTwenty : CGFloat = 20
    static let paddingFifteen : CGFloat = 15
    static let frameTwentyThree : CGFloat = 23
    static let frameEighteen : CGFloat = 18
  }
}

