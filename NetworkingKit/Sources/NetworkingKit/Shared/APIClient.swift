//
//  APIClient.swift
//  
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Foundation

protocol APIClient {
    
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T
}

//TODO: make more robust

extension APIClient {
    
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        var request = URLRequest(url: endpoint.url)
        request.httpMethod = endpoint.method.rawValue
        let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
