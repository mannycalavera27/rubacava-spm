//
//  NetworkRouter.swift
//  
//
//  Created by Tiziano Cialfi on 20/01/21.
//

import Foundation

public protocol NetworkRouter {
    var scheme: String { get }
    var host: String { get }
    var port: Int? { get }
    var contentType: String { get }
    var authenticationToken: String? { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: String { get }
    var body: Data? { get }
}
