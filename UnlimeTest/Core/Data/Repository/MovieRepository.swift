//
//  MovieRepository.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Combine
import Alamofire

protocol MovieRepository {
    func getMovie(page: Int) -> AnyPublisher<Movie, RemoteError>
}
