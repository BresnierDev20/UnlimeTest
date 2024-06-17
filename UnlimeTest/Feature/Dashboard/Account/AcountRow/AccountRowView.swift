//
//  ProfileRowView.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import SwiftUI

struct AccountRowView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    AccountRowView(title: "test")
}
