//
//  MovieCollectionViewCell.swift
//  CodeChallenge
//
//  Created by Peripolli on 09/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: DownloadableImageView!
    
    var movie: Movie?
    
    static var identifier = "MovieCollectionViewCell"
    
    func setup(movie: Movie) {
        self.movie = movie
        self.movieImage.loadImage(using: movie.posterPath)
    }

}
