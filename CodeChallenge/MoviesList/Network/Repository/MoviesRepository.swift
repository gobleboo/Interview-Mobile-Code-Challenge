//
//  MoviesRepository.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func fetchLatestMovies(page: Int, completion: @escaping (Result<[Movie], NetworkError>) -> ())
    func fetchNewMovies(page: Int, completion: @escaping (Result<[Movie], NetworkError>) -> ())
}

class MoviesRepository {
    static let movieAPIKey = "1af49bdb687215968a60782d9f9b39e6"
    private let router = Router<MovieAPI>()
}

extension MoviesRepository: MoviesRepositoryProtocol {
    func fetchLatestMovies(page: Int, completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        router.request(.topRated(page: page)) { data, response, error in
            if error != nil {
                completion(.failure(.encodingFailed))
            }
                        
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
    
    func fetchNewMovies(page: Int, completion: @escaping (Result<[Movie], NetworkError>) -> ()) {
        router.request(.newMovies(page: page)) { data, response, error in
            if error != nil {
                completion(.failure(.encodingFailed))
            }
            
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
