//
//  NetworkRouter.swift
//  
//
//  Created by Tiziano Cialfi on 20/01/21.
//

import Foundation

public protocol NetworkRouter {
    var scheme: String { get set }
    var host: String { get set }
    var port: Int? { get set }
    var contentType: String { get set }
    var authenticationToken: String? { get set }
    var path: String { get set }
    var parameters: [URLQueryItem]? { get set }
    var method: String { get set }
    var body: Data? { get set }
}
