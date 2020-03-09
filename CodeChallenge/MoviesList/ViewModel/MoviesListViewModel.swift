//
//  MoviesListViewModel.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

protocol MoviesListViewModelDelegate: class {
    func updateUI()
}

class MoviesListViewModel {
    
    private let moviesRepository: MoviesRepositoryProtocol
    weak var delegate: MoviesListViewModelDelegate?
    var latestMoviesPage = 1
    var movies: [Movie] = [Movie]() {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.updateUI()
            }
        }
    }
    
    var numberOfMovies: Int {
        return movies.count
    }
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.moviesRepository = moviesRepository
    }
    
    func fetchLatestMovies() {
        moviesRepository.fetchLatestMovies(page: latestMoviesPage) { result in
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
