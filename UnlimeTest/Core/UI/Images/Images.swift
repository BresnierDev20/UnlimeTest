//
//  Images.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

class Images {
    static let arrowBackIcon = "ic_arrow_back"
    static let ic_failed = "ic_failed"
    static let backgroundImage = "auth_movie"
    static let logo = "logo"
    static let ic_apple = "logo_apple"
    static let ic_facebook = "logo_facebook"
    static let ic_google = "logo_google"
    static let ic_key = "icon_key"
    static let ic_email = "icon_email"
  
}

extension Image {
  static func fromSystem(_ s: ImageIdentifier) -> Image {
    return Image(systemName: s.rawValue)
  }
}

enum ImageIdentifier: String {
    case heart = "heart"
    case eyeSlash = "eye.slash.fill"
    case eyefill = "eye.fill"
    case account = "account_fill"
    case start = "start_fill"
    case trips = "trips_fill"
}
