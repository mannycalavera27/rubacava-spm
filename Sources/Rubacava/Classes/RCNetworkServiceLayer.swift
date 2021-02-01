//
//  RCNetworkServiceLayer.swift
//  
//
//  Created by Tiziano Cialfi on 20/01/21.
//

import Foundation

public class RCNetworkServiceLayer {

    public static func request<T: Decodable, N: RCNetworkRouter>(router: N, completion: @escaping(Result<T, RCNetworkError>) -> ()) {
        
        let components = createComponents(from: router)
        do {
            let urlRequest = try createUrlRequest(url: components.url, router: router)
            
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                
                do {
                    try validate(response: response, error: error)
                } catch RCNetworkError.noConnection {
                    completion(.failure(.noConnection))
                } catch RCNetworkError.noResponse {
                    completion(.failure(.noResponse))
                } catch RCNetworkError.noHttpResponse {
                    completion(.failure(.noHttpResponse))
                } catch RCNetworkError.badRequest {
                    completion(.failure(.badRequest))
                } catch RCNetworkError.unauthorize {
                    completion(.failure(.unauthorize))
                } catch RCNetworkError.forbidden {
                    completion(.failure(.forbidden))
                } catch {
                    completion(.failure(.unknown))
                }
                
                do {
                    let parsedData = try parseResponse(data: data, into: T.self)
                    completion(.success(parsedData))
                    return
                } catch RCNetworkError.noData {
                    completion(.failure(.noData))
                    return
                } catch let jsonDecodingError as RCNetworkError.JsonDecodingError {
                    completion(.failure(.jsonDecoding(error: jsonDecodingError)))
                    return
                } catch {
                    completion(.failure(.unknown))
                    return
                }

            }
            dataTask.resume()
    
        } catch {
            completion(.failure(.badUrl))
        }

    }
    
    private static func validate(response: URLResponse?, error: Error?) throws {
        if error != nil {
            throw RCNetworkError.noConnection
        }
        
        guard
            response != nil
        else {
            throw RCNetworkError.noResponse
        }
        
        guard
            let httpResponse = response as? HTTPURLResponse
        else {
            throw RCNetworkError.noHttpResponse
        }
        
        switch httpResponse.statusCode {
        case 0...299:
            return
        case 400:
            throw RCNetworkError.badRequest
        case 401:
            throw RCNetworkError.unauthorize
        case 403:
            throw RCNetworkError.forbidden
        default:
            throw RCNetworkError.unknown
        }
    
    }
    
    private static func createComponents<N: RCNetworkRouter>(from router: N) -> URLComponents {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.port = router.port
        components.path = router.path
        components.queryItems = router.parameters
        return components
    }
    
    private static func createUrlRequest<N: RCNetworkRouter>(url: URL?, router: N) throws -> URLRequest {
        guard
            let url = url
        else {
            throw RCNetworkError.badUrl
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        urlRequest.httpBody = router.body
        urlRequest.addValue(router.contentType, forHTTPHeaderField: "Content-Type")
        if let authenticationToken = router.authenticationToken {
            urlRequest.addValue(authenticationToken, forHTTPHeaderField: "X-Auth")
        }
        return urlRequest
    }
    
    private static func parseResponse<T: Decodable>(data: Data?, into: T.Type) throws -> T{
        guard
            let data = data
        else {
            throw RCNetworkError.noData
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .custom(customDateDecodingStrategy)
        
        do {
            let parsedData = try decoder.decode(T.self, from: data)
            return parsedData
        } catch let decodingError as DecodingError {
            switch decodingError {
            case .typeMismatch(let key, let value):
                throw RCNetworkError.JsonDecodingError.typeMismatch(key: key, value: value)
            case .valueNotFound(let key, let value):
                throw RCNetworkError.JsonDecodingError.valueNotFound(key: key, value: value)
            case .keyNotFound(let key, let value):
                throw RCNetworkError.JsonDecodingError.keyNotFound(key: key, value: value)
            case .dataCorrupted(let key):
                throw RCNetworkError.JsonDecodingError.dataCorrupted(key: key)
            default:
                throw RCNetworkError.JsonDecodingError.unknown
            }
        } catch {
            throw RCNetworkError.JsonDecodingError.unknown
        }
    }
    
    private static func customDateDecodingStrategy(decoder: Decoder) throws -> Date {
        let singleValueContainer = try decoder.singleValueContainer()
        let dateString = try singleValueContainer.decode(String.self)
        
        if dateString.isEmpty {
            throw RCNetworkError.JsonDecodingError.DateDecodingError.isEmpty
        }
        
        if let date = DateFormatter.standardWithTSeparator.date(from: dateString) {
            return date
        } else if let date = DateFormatter.acf.date(from: dateString) {
            return date
        } else {
            if let timeInterval = TimeInterval(dateString) {
                return Date(timeIntervalSince1970: timeInterval / 1000)
            }
        }
        throw RCNetworkError.JsonDecodingError.DateDecodingError.formatterUnavailable
    }
}
