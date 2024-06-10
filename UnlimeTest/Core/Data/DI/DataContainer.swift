//
//  DataContainer.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Factory

extension Container {
    static var movieRepository: MovieRepository { MovieRepositoryImpl() }
}
