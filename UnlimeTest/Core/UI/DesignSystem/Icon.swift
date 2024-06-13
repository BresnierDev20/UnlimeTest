//
//  Icon.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import SwiftUI

extension Image {
  func displayAsIcon(size: CGFloat = 13,overlaySize: CGSize? = nil, overlayColor: Color, foregroundColor: Color = Color.hsPrimaryBlue) -> some View {
    let width = overlaySize == nil ? size * 3: overlaySize?.width
    let height = overlaySize == nil ? size * 3: overlaySize?.height
    return self
      .renderIcon()
      .frame(width: size, height: size)
      .foregroundColor(foregroundColor)
      .background(
        Circle()
          .fill(overlayColor)
          .frame(width: width, height: height)
      )
  }

  func renderIcon() -> some View {
    return self
      .renderingMode(.template)
      .resizable()
      .scaledToFit()
  }

  func renderBackButton(size: CGFloat = 15, overlaySize: CGSize? = nil, overlayColor: Color = Color.hsLightBlue, foregroundColor: Color = Color.white) -> some View {
    let width = overlaySize == nil ? size * 3: overlaySize?.width
    let height = overlaySize == nil ? size * 3: overlaySize?.height
    return self
      .renderIcon()
      .frame(width: size, height: size)
      .foregroundColor(foregroundColor)
      .background(
        Circle()
          .fill(overlayColor)
          .frame(width: width, height: height)
      )
  }
}
