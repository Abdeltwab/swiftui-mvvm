//
//  MockCharactersService.swift
//  
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import Foundation
import Combine

public class MockCharactersService: APIClient, CharactersServiceProtocol {
    public init() {}
    
    public func fetchCharacters() -> AnyPublisher<CharacterList, APIError> {
        let data = Bundle.stubbedDataFromJson(filename: "characters")
        let decoder = JSONDecoder()

        return Just(data)
            .decode(type: CharacterList.self, decoder: decoder)
            .mapError { _ in
                APIError.unknown
            }
            .map {$0}
            .eraseToAnyPublisher()
    }
    
}

extension Bundle {
    
    static func stubbedDataFromJson(filename: String) -> Data {
        return stubbedData(filename: filename, withExtension: "json")
    }

    static func stubbedData(filename: String, withExtension fileExtension: String) -> Data {
    
        guard  let stubURL = self.module.url(forResource: filename, withExtension: fileExtension) else {
            fatalError("file not found")
        }
        guard let stubData = try? Data(contentsOf: stubURL) else {
            fatalError("file not read")
        }
        return stubData
    }
    
}
