//
//  Seccion.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 16/6/24.
//

import Foundation

struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    let items: [String]
}
