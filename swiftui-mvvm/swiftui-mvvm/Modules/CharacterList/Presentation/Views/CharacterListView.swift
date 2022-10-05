//
//  CharacterListView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI


struct CharacterListView: View {
    @ObservedObject private var viewModel = Resolver.shared.resolve(CharacterListViewModel.self)
    init(viewModel:CharacterListViewModel ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List($viewModel.filteredList) { item in
            CharacterRowView(item.wrappedValue)
                .onTapGesture {
                    viewModel.selectedCharacter = item.wrappedValue
                }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Breaking Bad")
        .searchable(text: $viewModel.searchText)
    }
}
