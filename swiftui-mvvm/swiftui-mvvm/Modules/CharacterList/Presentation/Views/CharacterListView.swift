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
        List($viewModel.filteredList) { item in
            CharacterRowView()
            
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Breaking Bad")
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
