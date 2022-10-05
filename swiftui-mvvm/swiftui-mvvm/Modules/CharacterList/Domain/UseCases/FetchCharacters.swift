//
//  FetchCharacters.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import Combine
import NetworkingKit

struct FetchCharacters {
    private let service: CharactersServiceProtocol

    init(service: CharactersServiceProtocol) {
        self.service = service
    }

    func execute() -> AnyPublisher<[CharacterUIModel], APIError> {
        return service
            .fetchCharacters()
            .map { $0.map { CharacterUIModel(character: $0) } }
            .eraseToAnyPublisher()
    }
}
