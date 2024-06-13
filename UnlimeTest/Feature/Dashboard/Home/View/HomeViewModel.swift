//
//  HomeViewModel.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 8/6/24.
//

import Combine
import Factory
import SwiftUI

class HomeViewModel: ObservableObject {
    var getMovieUseCase = Container.getMovieUseCase
    var disposables : Set<AnyCancellable> = Set()

    @Published var movieDt: [Results] = []
    @Published var currentPage: Int = 1
    @Published var messageError: String = ""

    func getMovie(page: Int){
        getMovieUseCase.invoke(page: page)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                
                switch completion {
                case .finished:
                  break
                case .failure(let error):
                  print("Error occurred: \(error)")
                    self.handleMyOrdersError(error: error)
                }
                
            }, receiveValue: { [weak self] movieData in
                guard let self = self else { return }
                self.movieDt.append(contentsOf: movieData.results ?? [])
                
        }).store(in: &disposables)
    }
    
    func handleMyOrdersError(error: RemoteError) {
      switch error {
      case .apiError(let statusCode, _):
        if statusCode == 401 {
          showErrorMessage(message: "", isToken: true)
        } else {
    //      showErrorMessage(message: "API Error: Status Code \(statusCode)", isToken: false)
        }
      case .decodingError(let decodingError):
    //    showErrorMessage(message: "Decoding Error: \(decodingError)", isToken: false)
          break
      case .networkError:
    //    showErrorMessage(message: "\(Strings.txt_no_internet.localized(languageManager.language))", isToken: false)
          break
      }
    }
    
    func showErrorMessage(message: String, isToken: Bool) {
        messageError = message
    }
}


