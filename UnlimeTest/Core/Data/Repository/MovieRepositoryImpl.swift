//
//  MovieRepositoryImpl.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Combine
import Factory
import Alamofire

class MovieRepositoryImpl: MovieRepository {
    var remote = Container.MovieRemoteDataSource
    
    func getMovie(page: Int) -> AnyPublisher<Movie, RemoteError> {
        return remote.getMovie(page: page)
    }
}
