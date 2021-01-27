//
//  NetworkError.swift
//  
//
//  Created by Tiziano Cialfi on 20/01/21.
//

import Foundation

public enum NetworkError: Error {
    case badUrl
    case noConnection
    case noResponse
    case noHttpResponse
    case noData
    case unauthorize
    case forbidden
    case badRequest
    case response(message: String)
    case jsonDecoding(error: JsonDecodingError)
    case unknown
    
    public enum JsonDecodingError: Error {
        case typeMismatch(key: Any, value: Any)
        case valueNotFound(key: Any, value: Any)
        case keyNotFound(key: Any, value: Any)
        case dataCorrupted(key: Any)
        case date(error: DateDecodingError)
        case unknown
        
        public enum DateDecodingError: Error {
            case isEmpty
            case formatterUnavailable
        }
    }
}
