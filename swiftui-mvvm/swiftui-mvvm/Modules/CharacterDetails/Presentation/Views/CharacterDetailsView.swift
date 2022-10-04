//
//  CharacterDetailsView.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import SwiftUI

struct CharacterDetailsView: View {
    var body: some View {
        VStack {
            Text("Ttile")
                .font(.largeTitle)
            AsyncImage(url: URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!)
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
                    infoRow(emoj: "🥸", title: "Nickaame", value: "19-9-20")
                    infoRow(emoj: "🎂", title: "BirthDay", value: "19-9-20")
                    infoRow(emoj: "🤔", title: "Status", value: "19-9-20")
                    infoRow(emoj: "🎥", title: "Portrayed", value: "19-9-20")
                }
            }
            //
        }
        .navigationTitle("title")
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
struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView()
    }
}
