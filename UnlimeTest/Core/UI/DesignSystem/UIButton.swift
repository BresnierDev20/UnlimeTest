//
//  UIButton.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

struct PrimaryButtonModifier : ViewModifier {
  var applyPadding = true
  var isDisabled = false
  @State var isTapped = false
  var cornerRadius : CGFloat = 8

  func body(content: Content) -> some View {
    content
    .customFont(.regular, category: .medium)
    .foregroundColor(isDisabled ? .white : .black)
    .disabled(!isDisabled)
    .buttonStyle(
      PrimaryButtonStyle(
        isDisabled: isDisabled,
        cornerRadius: cornerRadius
      )
    )
  }
}

struct PrimaryButtonStyle : ButtonStyle {
  var isDisabled = false
  let cornerRadius : CGFloat
  func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed

    configuration.label
          .background(isDisabled ? Color.backgroundRed : Color.backgroundRed.opacity(0.7))
      .cornerRadius(cornerRadius)
      .scaleEffect( isPressed ? 0.9 : 1)
      .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: isPressed )
  }
}

extension PrimaryButtonModifier {
  class ConstantValues {
    static let height : CGFloat = 52
    static let minWidth : CGFloat = 100
    static let cornerRadius : CGFloat = 12
  }
}
