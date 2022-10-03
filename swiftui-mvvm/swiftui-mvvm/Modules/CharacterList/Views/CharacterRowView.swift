//
//  CharacterRowView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import SwiftUI

struct CharacterRowView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            AsyncImage(url:
                URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!
            ) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 300)
            .cornerRadius(12)

            Text("This is the Title")
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView()
    }
}
