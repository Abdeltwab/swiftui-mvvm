//
//  CharacterListView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI

struct CharacterListView: View {
    var body: some View {
        List {
            ForEach(1 ..< 5) { _ in
                CharacterRowView()
            }
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
