//
//  File.swift
//
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine
import Foundation

protocol CharactersServiceProtocol {
    func fetchCharacters() -> AnyPublisher<CharacterList, APIError>
}

struct CharactersService: APIClient, CharactersServiceProtocol {
    func fetchCharacters() -> AnyPublisher<CharacterList, APIError> {
        return
            sendRequest(endpoint: CharactersEndPoint.characters,
                        responseModel: CharacterList.self)
            .eraseToAnyPublisher()
    }
}
