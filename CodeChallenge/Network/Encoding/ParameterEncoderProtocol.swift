//
//  ParameterEncoding.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]

protocol ParameterEncoderProtocol {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
