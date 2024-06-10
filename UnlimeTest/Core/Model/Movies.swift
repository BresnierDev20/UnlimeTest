//
//  Movies.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

struct Movie: Codable, Hashable {
    let page: Int?
    let results : [Results]
    
    enum CodingKeys: String, CodingKey {
        case page
        case results = "results"
    }
}

struct Results: Codable, Hashable {
    let adult: Bool?
    let genre_ids: [Int]?
    let id: Int?
    let original_language: String?
    let original_title: String?
    let overview: String?
    let popularity: Double?
    let poster_path: String?
    let release_date: String?
    let title: String?
    let backdrop_path: String?
    let vote_count: Int
    let original_name: String?
}
