//
//  APIClient.swift
//
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Foundation

protocol APIClient {
    func sendRequest<T: Decodable>(
        endpoint: APIEndPoint,
        responseModel: T.Type
    ) async -> Result<T, APIError>
}

// TODO: make more robust

extension APIClient {
    func sendRequest<T: Decodable>(
        endpoint: APIEndPoint,
        responseModel: T.Type
    ) async -> Result<T, APIError> {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.unknown)
            }
            switch response.statusCode {
            case 200 ... 299:
                guard let model = try? JSONDecoder().decode(T.self, from: data) else {
                    return .failure(.unknown)
                }
                return .success(model)
            default:
                return .failure(.unknown)
            }

        } catch {
            return .failure(.unknown)
        }
    }
}
