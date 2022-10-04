//
//  CharacterDetailsViewModel.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import Foundation

class CharacterDetailsViewModel: ObservableObject {
    @Published var character: CharacterUIModel
    
    init(character:CharacterUIModel ) {
        self.character = character
    }
}
