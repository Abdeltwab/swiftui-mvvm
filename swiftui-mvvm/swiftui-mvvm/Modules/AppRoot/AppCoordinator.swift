
//Credites: https://quickbirdstudios.com/blog/coordinator-pattern-in-swiftui/

import SwiftUI
import NetworkingKit

protocol Navigable {
    associatedtype NavigationItem: Equatable
    func navigateTo(_ destaintion :NavigationItem)
}

class AppCoordinator: ObservableObject{
    @Published var  characterListCoordinator: CharacterListCoordinator?
    
    init() {
        characterListCoordinator = CharacterListCoordinator()
    }
}

struct AppCoordinatorView: View {
    @ObservedObject var appCoordinator: AppCoordinator

    var body: some View {
        CharacterListCoordinatorView(coordinator: appCoordinator.characterListCoordinator!)
    }
}
