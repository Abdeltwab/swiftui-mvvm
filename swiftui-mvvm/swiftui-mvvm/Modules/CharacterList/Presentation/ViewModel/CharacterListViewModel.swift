//
//  CharacterListViewModel.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine

class CharacterListViewModel: ObservableObject{
    @Published var filteredCharacters: [CharacterUIModel] = []
    @Published var searchText = ""

    var test = ""
    private var charactersResult: [CharacterUIModel] = []
    private var cancellables: Set<AnyCancellable> = []
    private let fetchCharactersUseCase : FetchCharacters
    
    
    init(fetchCharacters:FetchCharacters) {
        fetchCharactersUseCase = fetchCharacters
        getCharactersList()
    }
}

private extension CharacterListViewModel {
    
    func didSearchTextChange() {
        
    }
    
    func getCharactersList() {
        fetchCharactersUseCase
            .execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { [weak self] value in
                self?.charactersResult = value
            }).store(in: &cancellables)
    }
}
