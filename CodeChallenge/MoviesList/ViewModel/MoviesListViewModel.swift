//
//  MoviesListViewModel.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

class MoviesListViewModel {
    
    private let moviesRepository: MoviesRepositoryProtocol
    private var movies: [Movie] = [Movie]()
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.moviesRepository = moviesRepository
    }
    
    func fetchLatestMovies() {
        moviesRepository.fetchLatestMovies(page: 1) { result in
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchNewMovies() {
        moviesRepository.fetchNewMovies(page: 1) { result in
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                print(error)
            }
        }
    }
}
