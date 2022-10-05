//
//  CharacterDetailsView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import SwiftUI

struct CharacterDetailsView: View {
    @ObservedObject var viewModel = Resolver.shared.resolve(CharacterDetailsViewModel.self)
    
    private var charaterModel: CharacterUIModel {
        viewModel.character
    }

    var body: some View {
        VStack {
            Text(charaterModel.character.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            AsyncImage(url: charaterModel.imageURL)
            { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipped()
                
            } placeholder: {
                ProgressView()
            }
            .shadow(color: .gray, radius: 12)
            .frame(width: 300,
                   height: 300,
                   alignment: .top)
            
            List {
                Section(header: Text("Info")) {
                    infoRow(emoj: "🥸",
                            title: "Nickaame",
                            value: charaterModel.character.nickname)
                    infoRow(emoj: "🎂",
                            title:"BirthDay",
                            value: charaterModel.character.birthday)
                    infoRow(emoj: "🤔",
                            title: "Status",
                            value: charaterModel.character.status.rawValue)
                    infoRow(emoj: "🎥",
                            title: "Portrayed",
                            value: charaterModel.character.portrayed)
                }
            }
        }
    }
}

extension CharacterDetailsView {
    
    func infoRow(
        emoj: String,
        title: String,
        value: String) -> some View {
        HStack {
            Text(emoj)
            Text(title)
            Spacer()
            Text(value)
        }
    }
}
