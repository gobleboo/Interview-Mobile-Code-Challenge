//
//  ViewController.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var networkManager: NetworkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.getLatestMovies { result in
            switch result {
            case .success(let movies):
                for movie in movies {
                    print(movie.title)
                }
            case .failure(let error):
                print(error)
            }
        }
//        networkManager.getNewMovies(page: 1) { result in
//            switch result {
//            case .success(let movies):
//                for movie in movies {
//                    print(movie.title)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
}

