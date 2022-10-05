//
//  CharacterListView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel = Resolver.shared.resolve(CharactersListViewModel.self)
    init(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        List($viewModel.filteredList) { item in
            let wrappedItem = item.wrappedValue
            CharacterRowView(name: wrappedItem.character.name,
                             imageURL: wrappedItem.imageURL)
                .onTapGesture {
                    viewModel.selectedCharacter = wrappedItem
                }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Breaking Bad")
        .searchable(text: $viewModel.searchText)
    }
}
