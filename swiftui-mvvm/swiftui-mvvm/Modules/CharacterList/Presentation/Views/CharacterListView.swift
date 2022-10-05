//
//  CharacterListView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI


struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel //Resolver.shared.resolve(CharacterListViewModel.self)
    init(viewModel:CharacterListViewModel ) {
        self.viewModel = viewModel
    }
    
    var body: some View {
       // NavigationView {
            List($viewModel.filteredList) { item in
                CharacterRowView(item.wrappedValue)
                    .onTapGesture {
                        viewModel.open(route: .charList(item.wrappedValue))
                      //  viewModel.coordinator?.openCharacterDetailsVM(item.wrappedValue)
                    }
//                NavigationLink {
//                    CharacterDetailsView(
//                        viewModel: CharacterDetailsViewModel(
//                            character: item.wrappedValue))
//                } label: {
//                    CharacterRowView(item.wrappedValue)
//                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Breaking Bad")
            .searchable(text: $viewModel.searchText)
     //   }
        
    }
}

//struct CharacterListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterListView()
//    }
//}
