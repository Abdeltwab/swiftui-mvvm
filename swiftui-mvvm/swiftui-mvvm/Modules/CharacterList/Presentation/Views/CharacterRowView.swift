//
//  CharacterRowView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI

struct CharacterRowView: View {
    private let name: String
    private let imageURL: URL

    init(name: String,
         imageURL: URL)
    {
        self.name = name
        self.imageURL = imageURL
    }

    var body: some View {
        VStack(spacing: 12) {
            AsyncImage(
                url: imageURL,
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

            Text(name)
        }
    }
}
