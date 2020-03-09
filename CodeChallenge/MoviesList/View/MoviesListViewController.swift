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
        self.title = "Movies"
        self.moviesListViewModel.delegate = self
        self.moviesListViewModel.fetchLatestMovies()
        self.setupCollectionView()
    }
    
    private func setupCollectionView() {
        moviesListCollectionView.delegate = self
        moviesListCollectionView.dataSource = self
        let movieCellNib = UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil)
        moviesListCollectionView.register(movieCellNib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }
    
    private func showDetail(of movie: Movie?) {
        let controller = MovieDetailViewController()
        controller.movie = movie
        self.navigationController?.pushViewController(controller, animated: true)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? MovieCollectionViewCell else {
            fatalError("Could not select cell at index for type MovieCollectionViewCell")
        }
        self.showDetail(of: cell.movie)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height * 4{
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

extension MoviesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 2, height: collectionView.bounds.height / 2)
    }
}
