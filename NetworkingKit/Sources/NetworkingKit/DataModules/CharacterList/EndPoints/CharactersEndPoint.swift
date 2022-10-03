//
//  CharactersEndPoint.swift
//  
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Foundation

enum CharactersEndPoint {
    case characters
}

extension CharactersEndPoint: APIEndPoint {
    
    var path: String {
        switch self {
        case .characters:
            return "/api/characters"
        }
    }

}
