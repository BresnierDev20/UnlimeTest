//
//  MovieRemoteDtaSource.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Combine
import Alamofire

protocol MovieRemoteDtaSource {
    func getMovie(page: Int) -> AnyPublisher<Movie, RemoteError>
}
