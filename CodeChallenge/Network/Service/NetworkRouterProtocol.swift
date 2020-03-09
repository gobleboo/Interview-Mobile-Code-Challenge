//
//  NetworkRouterProtocol.swift
//  CodeChallenge
//
//  Created by Peripolli on 08/03/20.
//  Copyright © 2020 gobleboo. All rights reserved.
//

import Foundation

typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?) -> ()

protocol NetworkRouterProtocol: class {
    associatedtype EndPoint: EndPointProtocol
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
}
