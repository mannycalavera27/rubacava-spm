//
//  NetworkError.swift
//  
//
//  Created by Tiziano Cialfi on 20/01/21.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noConnection
    case noResponse
    case noHttpResponse
    case noData
    case jsonDecoding
    case unauthorize
    case forbidden
    case badRequest
    case response(message: String)
    case unknown
}
