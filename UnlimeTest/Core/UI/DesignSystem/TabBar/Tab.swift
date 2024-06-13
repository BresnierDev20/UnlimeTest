//
//  Tab.swift
//  UnlimeTest
//
//  Created by Bresnier Moreno on 12/6/24.
//

import SwiftUI

struct Tab: Hashable {
  let id: String
  let outlined: String
  let filled: String

  static let start = Tab(id: "start", outlined: "start_fill", filled: "start_fill")
  static let trips = Tab(id: "my trips", outlined: "trips_fill", filled: "trips_fill")
  static let account = Tab(id: "account", outlined: "account_fill", filled: "account_fill")
  static let allCases : [Tab] = [Tab.start, Tab.trips, Tab.account]
}
