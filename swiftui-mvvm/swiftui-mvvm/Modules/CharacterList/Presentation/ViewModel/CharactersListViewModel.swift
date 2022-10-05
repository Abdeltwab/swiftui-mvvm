//
//  CharacterListViewModel.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Combine
import Foundation

class CharactersListViewModel: ObservableObject, Navigable {
    
    enum Destination: Equatable{
        case characterDetails(CharacterUIModel)
    }
    
    @Published var filteredList: [CharacterUIModel] = []
    @Published var selectedCharacter: CharacterUIModel? = nil
    @Published  var charactersList: [CharacterUIModel] = []
    @Published var searchText = ""
    let coordinator: CharacterListCoordinator?
        
    private var cancellables: Set<AnyCancellable> = []
    private let fetchCharactersUseCase: FetchCharacters

    
    init(fetchCharacters: FetchCharacters ,
         coordinator: CharacterListCoordinator? = nil) {
        fetchCharactersUseCase = fetchCharacters
        self.coordinator = coordinator
        subscribeToCharacterSelection()
        subscribeToSearchTextChange()
        fetchCharactersList()
    }
    
    func navigateTo(_ destaintion: Destination) {
        switch destaintion {
        case .characterDetails(let characterUIModel):
             coordinator?.characterDetails(characterUIModel)
        }
    }

}

private extension CharactersListViewModel {
    
    func subscribeToCharacterSelection(){
        $selectedCharacter
            .compactMap{ $0}
            .sink{ [weak self] character in
                guard let self = self else { return }
                self.navigateTo(.characterDetails(character))
            }
            .store(in: &cancellables)
        
    }
    
    func fetchCharactersList() {
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
