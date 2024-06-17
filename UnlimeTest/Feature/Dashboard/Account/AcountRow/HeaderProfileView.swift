//
//  HeaderProfileView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import SwiftUI

struct HeaderProfileView: View {
    var title: String
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .customFont(.bold, size: 16)
                .foregroundColor(.titleBlue)
                
            Spacer()
         
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .foregroundColor(.titleBlue)
        }
    }
}

#Preview {
    HeaderProfileView(title: "as", action: {})
}
