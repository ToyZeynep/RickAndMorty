//
//  ApiConfiguration.swift
//  RickAndMorty-Beta
//
//  Created by MacOS on 14.10.2021.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
