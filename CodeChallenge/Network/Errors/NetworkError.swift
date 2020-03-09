//
//  NetworkError.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameters encoding failed."
    case missingURL = "URL is nil"
}
