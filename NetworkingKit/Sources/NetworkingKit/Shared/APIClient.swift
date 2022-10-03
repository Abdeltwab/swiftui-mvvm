//
//  APIClient.swift
//
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine
import Foundation

protocol APIClient {
    var session: URLSession { get }

    func sendRequest<T: Decodable>(
        endpoint: APIEndPoint,
        responseModel: T.Type
    ) -> AnyPublisher<T, APIError>
}

// TODO: make more robust

extension APIClient {
    
    var session : URLSession {
        URLSession.shared
    }
    
    func sendRequest<T: Decodable>(
        endpoint: APIEndPoint,
        responseModel: T.Type
    ) -> AnyPublisher<T, APIError> {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        return session
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { _ in
                APIError.unknown
            }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }

                switch response.statusCode {
                case 200 ... 299:
                    let decoder = JSONDecoder()
                    return Just(data)
                        .decode(type: T.self, decoder: decoder)
                        .mapError { _ in
                            APIError.unknown
                        }
                        .map { $0 }
                        .eraseToAnyPublisher()
                default:
                    return Fail(error: APIError.unknown)
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}
