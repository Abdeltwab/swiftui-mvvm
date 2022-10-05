//
//  AppCoordinator.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 05/10/2022.

//Credites: https://quickbirdstudios.com/blog/coordinator-pattern-in-swiftui/

import SwiftUI
import NetworkingKit



protocol Navigable {
    associatedtype NavigationItem: Equatable
    func open(route :NavigationItem)
}


class AppCoordinator: ObservableObject{
    @Published var charactersListCoordinator: CharacterListCoordinator?

    @Published var charactersListVM: CharacterListViewModel?
    @Published var characterDetailsVM: CharacterDetailsViewModel?
    
     init() {
         charactersListCoordinator = CharacterListCoordinator()
    }

}

struct AppCoordinatorView: View {
    @ObservedObject var coordinatorObject: AppCoordinator

    var body: some View {
        CharacterListCoordinatorView(coordinatorObject: coordinatorObject.charactersListCoordinator!)
    }
}



class CharacterListCoordinator: ObservableObject {
    
    @Published var charactersListVM: CharacterListViewModel?
    @Published var characterDetailsVM: CharacterDetailsViewModel?

    init() {
        let fetchCharsUseCase = FetchCharacters(service: CharactersService())
        charactersListVM = CharacterListViewModel(fetchCharacters: fetchCharsUseCase,
                                                  coordinator: self)
        
   }
    
  
    func characterDetails(_ character: CharacterUIModel) {
        characterDetailsVM = CharacterDetailsViewModel(character: character)
    }

}

struct CharacterListCoordinatorView: View {
    
    @ObservedObject var coordinatorObject: CharacterListCoordinator

    var body: some View {
        NavigationView {
            CharacterListView(viewModel: coordinatorObject.charactersListVM!)
                .navigation(item: $coordinatorObject.characterDetailsVM) {
                    CharacterDetailsView(viewModel: $0)
                }
        }
    }
    
}


// Helper
extension View {

    func onNavigation(_ action: @escaping () -> Void) -> some View {
        let isActive = Binding(
            get: { false },
            set: { newValue in
                if newValue {
                    action()
                }
            }
        )
        return NavigationLink(
            destination: EmptyView(),
            isActive: isActive
        ) {
            self
        }
    }

    func navigation<Item, Destination: View>(
        item: Binding<Item?>,
        @ViewBuilder destination: (Item) -> Destination
    ) -> some View {
        let isActive = Binding(
            get: { item.wrappedValue != nil },
            set: { value in
                if !value {
                    item.wrappedValue = nil
                }
            }
        )
        return navigation(isActive: isActive) {
            item.wrappedValue.map(destination)
        }
    }

    func navigation<Destination: View>(
        isActive: Binding<Bool>,
        @ViewBuilder destination: () -> Destination
    ) -> some View {
        overlay(
            NavigationLink(
                destination: isActive.wrappedValue ? destination() : nil,
                isActive: isActive,
                label: { EmptyView() }
            )
        )
    }

}