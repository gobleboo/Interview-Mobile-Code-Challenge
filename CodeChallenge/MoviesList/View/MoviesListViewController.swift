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
    
    var moviesListViewModel = MoviesListViewModel() {
        didSet {
            self.updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesListViewModel.fetchLatestMovies()
    }

    private func updateUI() {
        print("AIAI")
    }
}
