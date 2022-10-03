//
//  CharacterListViewModel.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine
import NetworkingKit

class CharacterListViewModel {
    @Published var filteredCharacters: CharacterList = []
    @Published var searchText = ""

    private var charactersResult: CharacterList = []
    private var cancellables: Set<AnyCancellable> = []
    private let fetchCharactersUseCase : FetchCharacters
    
    
    init(fetchCharacters:FetchCharacters) {
        fetchCharactersUseCase = fetchCharacters
    }
}

private extension CharacterListViewModel {
    
}
