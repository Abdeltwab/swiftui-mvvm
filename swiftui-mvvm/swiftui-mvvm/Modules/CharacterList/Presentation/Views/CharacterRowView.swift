//
//  CharacterRowView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI

struct CharacterRowView: View {
    private let item: CharacterUIModel

    init(_ item: CharacterUIModel) {
        self.item = item
    }

    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(
                url: item.imageURL,
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipped()
                },
                placeholder: {
                    ProgressView()
                })
                .cornerRadius(12)

            Text(item.character.name)
        }
    }
}

// struct CharacterRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterRowView(CharacterUIModel(character: Character())
//    }
// }
