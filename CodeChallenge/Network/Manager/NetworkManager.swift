//
//  NetworkManager.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    enum NetworkResponse: String {
        case success
        case authenticationError = "You need to be authenticated first."
        case badRequest = "Bad request."
        case outdated = "The url you requested is outdated."
        case failed = "Network request failed."
        case noData = "Response returned with no data to decode."
        case unableToDecode = "We could not decode the response"
    }
    
    static let movieAPIKey = "1af49bdb687215968a60782d9f9b39e6"
    private let router = Router<MovieAPI>()
    
    func getNewMovies(page: Int, completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
//        router.request(.newMovies(page: page)) { data, response, error in
//            
//        }
        router.request(.newMovies(page: 1)) { data, response, error in
            if error != nil {
                completion(.failure(.encodingFailed))
            }
            
//            if let response = response as? HTTPURLResponse {
//
//            }
            guard let data = data else {
                completion(.failure(.parametersNil))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: data)
                completion(.success(apiResponse.movies))
            } catch {
                completion(.failure(.missingURL))
            }
        }
    }
}
