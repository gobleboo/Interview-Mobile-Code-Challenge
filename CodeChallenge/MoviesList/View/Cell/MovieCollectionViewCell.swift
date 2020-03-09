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
    @IBOutlet weak var titleLabel: UILabel!
    
    static var identifier = "MovieCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(movie: Movie) {
        self.titleLabel.text = movie.title
        self.movieImage.loadImage(using: movie.posterPath)
    }

}
