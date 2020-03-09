//
//  EndPointProtocol.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

protocol EndPointProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
