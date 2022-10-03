//
//  File.swift
//
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine
import Foundation

public protocol CharactersServiceProtocol {
    func fetchCharacters() -> AnyPublisher<CharacterList, APIError>
}

public struct CharactersService: APIClient, CharactersServiceProtocol {
    public func fetchCharacters() -> AnyPublisher<CharacterList, APIError> {
        return
            sendRequest(endpoint: CharactersEndPoint.characters,
                        responseModel: CharacterList.self)
            .eraseToAnyPublisher()
    }
}
