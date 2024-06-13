//
//  UTSettings.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 9/6/24.
//

import SwiftUI

struct UTSettings {
    static var current: UTSettings = .init()
    
    var rows = [GridItem(.fixed(300))]
    var apiKey: String = "27393eaeb2b4e83fc500a5019d7b300d"
}
