//
//  MovieDetailViewController.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        self.setupLabels()
    }
    
    private func setupLabels() {
        self.titleLabel.text = movie?.title
        self.releaseDateLabel.text = "Released in \(movie?.releaseDate ?? "")"
        self.synopsisLabel.text = movie?.overview
    }
}
