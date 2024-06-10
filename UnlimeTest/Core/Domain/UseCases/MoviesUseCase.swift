//
//  MoviesUseCase.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Factory
import Combine

class MovieUseCase {
    var repo = Container.movieRepository

    func invoke(page: Int) -> AnyPublisher<Movie, RemoteError> {
      return repo.getMovie(page: page)
  }
}
