//
//  CharacterListView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI


struct CharacterListView: View {
    @ObservedObject private var viewModel = Resolver.shared.resolve(CharacterListViewModel.self)
    
    var body: some View {
        NavigationView {
            List($viewModel.filteredList) { item in
                NavigationLink {
                    CharacterDetailsView(
                        viewModel: CharacterDetailsViewModel(
                            character: item.wrappedValue))
                } label: {
                    CharacterRowView(item.wrappedValue)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Breaking Bad")
            .searchable(text: $viewModel.searchText)
        }
        
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
