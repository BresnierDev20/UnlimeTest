//
//  SingUpDivider.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import SwiftUI

struct SingUpDivider: View {
  let label: String
  let horizontalPadding: CGFloat
  let color: Color

  init(label: String, horizontalPadding: CGFloat = 15, color: Color = Color.gray) {
    self.label = label
    self.horizontalPadding = horizontalPadding
    self.color = color
  }

  var body: some View {
    HStack {
      line
        Text(label).foregroundColor(Color.gray).customFont(.bold, category: .small)
      line
    }
  }

  var line: some View {
    VStack { Divider().background(color) }.padding(horizontalPadding)
  }
}
