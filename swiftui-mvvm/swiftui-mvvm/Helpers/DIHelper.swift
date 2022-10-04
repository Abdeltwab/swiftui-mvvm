//
//  DIHelper.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import NetworkingKit
import Swinject

@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        wrappedValue = Resolver.shared.resolve(Component.self)
    }
}

class Resolver {
    static let shared = Resolver()
    private var container = buildContainer()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}

private func buildContainer() -> Container {
    let container = Container()
    
    container.register(CharactersService.self) { _ in
        CharactersService()
    }

    container.register(FetchCharacters.self) { resolver in
        FetchCharacters(
            service: resolver.resolve(
                CharactersService.self) ??
                CharactersService()
        )
    }
    
    container.register(CharacterListViewModel.self) { resolver in
        CharacterListViewModel(
            fetchCharacters:resolver.resolve(
                FetchCharacters.self)!
        )
    }
    
//    container.register(CharacterDetailsViewModel.self) { resolver in
//        CharacterDetailsViewModel(character: <#T##CharacterUIModel#>)
//    }
    
    return container
}
