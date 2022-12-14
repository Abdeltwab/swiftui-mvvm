//
//  DIHelper.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//
//Credits : https://github.com/dnKaratzas/SwiftUI-Weather
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

    container.register(AppCoordinator.self) { _ in
        AppCoordinator()
    }
    .inObjectScope(.container)
    
    container.register(CharacterListCoordinator.self) { _ in
        CharacterListCoordinator()
    }
    .inObjectScope(.container)
    
    container.register(CharactersService.self) { _ in
        CharactersService()
    }
    .inObjectScope(.container)

    container.register(FetchCharacters.self) { resolver in
        FetchCharacters(
            service: resolver.resolve(
                CharactersService.self) ??
                CharactersService()
        )
    }
    .inObjectScope(.container)

    container.register(CharactersListViewModel.self) { resolver in
        CharactersListViewModel(
            fetchCharacters:resolver.resolve(
                FetchCharacters.self)!
        )
    }
    .inObjectScope(.container)
    
    container.register(CharacterDetailsViewModel.self) { _ , character in
        CharacterDetailsViewModel(character: character)
    }
    .inObjectScope(.container)
    
    return container
}

