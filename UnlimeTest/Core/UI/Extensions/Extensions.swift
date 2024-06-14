//
//  Extensions.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

extension ContentSizeCategory {
  var size: CGFloat {
    switch self {
      case .extraSmall:
        return 10
      case .small:
        return 12
      case .medium:
        return 16
      case .large:
        return 20
      case .extraLarge:
        return 24
      case .extraExtraLarge:
        return 26
      default:
        return 16
    }
  }
}

extension View {
  func customFont(_ font: Poppins, size: CGFloat) -> some View {
    self.font(.custom(font.rawValue, size: size, relativeTo: .headline))
  }

  func customFont(_ font: Poppins, category: ContentSizeCategory) -> some View {
    customFont(font.rawValue, category: category)
  }

  func customFont(_ name: String, category: ContentSizeCategory) -> some View {
    return font(.custom(name, size: category.size))
  }

  func customFont(_ name: String, size: CGFloat) -> some View {
    return font(.custom(name, size: size))
  }

  func customFont(_ font: Poppins, size: CGFloat, category: ContentSizeCategory) -> some View {
    self.font(.custom(font.rawValue, size: size, relativeTo: .headline))
  }
    
    func filledStyle(isDisabled: Bool, colorIsEnable: Color, colorIsDisabled: Color) -> some View {
        modifier(PrimaryButtonModifier(isDisabled: isDisabled, colorIsEnable: colorIsEnable, colorIsDisabled: colorIsDisabled))
  }
}

