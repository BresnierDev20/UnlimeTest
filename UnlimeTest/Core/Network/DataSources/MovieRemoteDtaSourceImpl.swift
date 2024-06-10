//
//  MovieRemoteDtaSourceImpl.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Combine
import Alamofire
import Factory
import SwiftUI

class MovieRemoteDtaSourceImpl : MovieRemoteDtaSource {    
    func getMovie(page: Int) -> AnyPublisher<Movie, RemoteError> {
        let url = APIReddit.baseUrl + "popular?api_key=\(UTSettings.current.apiKey)&page=\(page)"
        
        return AF.request(url, method: .get)
            .publishData()
            .tryMap { dataResponse -> Data in
                guard let statusCode = dataResponse.response?.statusCode else {
                    throw RemoteError.networkError(NSError(domain: "Invalid response", code: 0, userInfo: nil))
                }

                if 200..<300 ~= statusCode {
                    return dataResponse.data ?? Data()
                } else if statusCode == 401 {
                    throw RemoteError.apiError(statusCode, Data())
                } else {
                    throw RemoteError.apiError(statusCode, dataResponse.data ?? Data())
                }
            }
            .decode(type: Movie.self, decoder: JSONDecoder())
            .mapError { error -> RemoteError in
                if let apiError = error as? RemoteError {
                    return apiError
                } else {
                    return RemoteError.decodingError(error)
                }
            } .eraseToAnyPublisher()
    }
}

struct APIReddit {
    static let baseUrl = URLDomains.BASE
}

enum RemoteError: Error {
  case networkError(Error)
  case apiError(Int, Data)
  case decodingError(Error)
}

