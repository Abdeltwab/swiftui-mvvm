//
//  CharacterListCoordinator.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 05/10/2022.
//

import SwiftUI
import  NetworkingKit

class CharacterListCoordinator: ObservableObject {
    
    @Published var charactersListVM: CharactersListViewModel?
    @Published var characterDetailsVM: CharacterDetailsViewModel?

    init() {
        let fetchCharsUseCase = FetchCharacters(service: CharactersService())
        charactersListVM = CharactersListViewModel(fetchCharacters: fetchCharsUseCase,
                                                  coordinator: self)
   }
    
    func characterDetails(_ character: CharacterUIModel) {
        characterDetailsVM = CharacterDetailsViewModel(character: character)
    }

}

struct CharacterListCoordinatorView: View {
    
    @ObservedObject var coordinator: CharacterListCoordinator

    var body: some View {
        NavigationView {
            CharactersListView(viewModel: coordinator.charactersListVM!)
                .navigation(item: $coordinator.characterDetailsVM) {
                    CharacterDetailsView(viewModel: $0)
                }
        }
    }
    
}

