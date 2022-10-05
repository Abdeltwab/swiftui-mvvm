//
//  CharacterListViewModel.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine
import Foundation

class CharacterListViewModel: ObservableObject, Navigable {
    enum Destination: Equatable{
        case charList(CharacterUIModel)
    }
        
    @Published var filteredList: [CharacterUIModel] = []
    @Published var selectedCharacter: CharacterUIModel? = nil
    @Published var searchText = ""

    @Published var charactersList: [CharacterUIModel] = []
    private var cancellables: Set<AnyCancellable> = []
    private let fetchCharactersUseCase: FetchCharacters
    let coordinator: CharacterListCoordinator?

    
    init(fetchCharacters: FetchCharacters ,
         coordinator: CharacterListCoordinator? = nil) {
        fetchCharactersUseCase = fetchCharacters
        self.coordinator = coordinator
        subscribeToSearchTextChange()
        getCharactersList()
    }
    
    
    func open(route: Destination) {
        switch route {
        case .charList(let characterUIModel):
             coordinator?.characterDetails(characterUIModel)
        }
    }
    
    
    func getCharactersList() {
        fetchCharactersUseCase
            .execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    print(error)
                case .finished:
                    print("finished")
                }
            }, receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.charactersList = value
            }).store(in: &cancellables)
    }
}

private extension CharacterListViewModel {
    
    func subscribeToSearchTextChange() {
        $searchText
            .combineLatest($charactersList)
            .debounce(for: .seconds(0.3),
                      scheduler: DispatchQueue.main)
            .map(filterCharactersList)
            .sink { [weak self] characters in
                guard let self = self else { return }
                self.filteredList = characters
            }
            .store(in: &cancellables)
    }

    func filterCharactersList(text: String,
                              list: [CharacterUIModel]) -> [CharacterUIModel] {
        text.isEmpty ?
        list : list.filter {
            $0.character.name.localizedCaseInsensitiveContains(text)
        }
    }

    
}
