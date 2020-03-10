//
//  MovieAPI.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

enum MovieAPI {
    case newMovies(page: Int)
    case topRated(page: Int)
}

extension MovieAPI: EndPointProtocol {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/") else {
            fatalError("baseURL could not be configured.")
        }
        
        return url
    }
    
    var path: String {
        switch self {
        case .newMovies:
            return "now_playing"
        case .topRated:
            return "top_rated"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .newMovies(let page), .topRated(let page):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["page": page,
                                                      "api_key": ""])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
