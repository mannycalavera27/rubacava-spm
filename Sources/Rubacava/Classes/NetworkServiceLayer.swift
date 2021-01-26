//
//  NetworkServiceLayer.swift
//  
//
//  Created by Tiziano Cialfi on 20/01/21.
//

import Foundation

public class NetworkServiceLayer {

    static func request<T: Decodable, N: NetworkRouter>(router: N, completion: @escaping(Result<T, NetworkError>) -> ()) {
        
        let components = createComponents(from: router)
        do {
            let urlRequest = try createUrlRequest(url: components.url, router: router)
            
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                
                do {
                    try validate(response: response, error: error)
                } catch NetworkError.noConnection {
                    completion(.failure(.noConnection))
                } catch NetworkError.noResponse {
                    completion(.failure(.noResponse))
                } catch NetworkError.noHttpResponse {
                    completion(.failure(.noHttpResponse))
                } catch NetworkError.badRequest {
                    completion(.failure(.badRequest))
                } catch NetworkError.unauthorize {
                    completion(.failure(.unauthorize))
                } catch NetworkError.forbidden {
                    completion(.failure(.forbidden))
                } catch {
                    completion(.failure(.unknown))
                }
                
                do {
                    let parsedData = try parseResponse(data: data, into: T.self)
                    completion(.success(parsedData))
                    return
                } catch NetworkError.noData {
                    completion(.failure(.noData))
                    return
                } catch NetworkError.jsonDecoding {
                    completion(.failure(.jsonDecoding))
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
    
    static private func validate(response: URLResponse?, error: Error?) throws {
        if error != nil {
            throw NetworkError.noConnection
        }
        
        guard
            response != nil
        else {
            throw NetworkError.noResponse
        }
        
        guard
            let httpResponse = response as? HTTPURLResponse
        else {
            throw NetworkError.noHttpResponse
        }
        
        switch httpResponse.statusCode {
        case 0...299:
            return
        case 400:
            throw NetworkError.badRequest
        case 401:
            throw NetworkError.unauthorize
        case 403:
            throw NetworkError.forbidden
        default:
            throw NetworkError.unknown
        }
    
    }
    
    static private func createComponents<N: NetworkRouter>(from router: N) -> URLComponents {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.port = router.port
        components.path = router.path
        components.queryItems = router.parameters
        return components
    }
    
    static private func createUrlRequest<N: NetworkRouter>(url: URL?, router: N) throws -> URLRequest {
        guard
            let url = url
        else {
            throw NetworkError.badUrl
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
    
    static private func parseResponse<T: Decodable>(data: Data?, into: T.Type) throws -> T{
        guard
            let data = data
        else {
            throw NetworkError.noData
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let parsedData = try decoder.decode(T.self, from: data)
            return parsedData
        } catch {
            throw NetworkError.jsonDecoding
        }
    }
}