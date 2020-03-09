//
//  MoviesListViewController.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var moviesListCollectionView: UICollectionView!
    
    var moviesListViewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesListViewModel.delegate = self
        moviesListViewModel.fetchLatestMovies()
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        moviesListCollectionView.delegate = self
        moviesListCollectionView.dataSource = self
        let movieCellNib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        moviesListCollectionView.register(movieCellNib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
}

extension MoviesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesListViewModel.numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Could not dequeue cell for type MovieCollectionViewCell")
        }
        
        cell.setup(movie: moviesListViewModel.movies[indexPath.item])
        return cell
    }
}

extension MoviesListViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !moviesListViewModel.isLoading {
                moviesListViewModel.fetchLatestMovies()
            }
        }
    }
}

extension MoviesListViewController: MoviesListViewModelDelegate {
    func updateUI() {
        self.moviesListCollectionView.reloadData()
    }
}
