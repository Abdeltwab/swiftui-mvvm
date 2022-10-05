//
//  CharacterUIModel.swift
//  swiftui-mvvm
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import NetworkingKit
import Foundation

struct CharacterUIModel: Identifiable, Equatable{
    let character: Character
    
    var id: Int {
        character.id
    }
    
    var imageURL: URL{
        URL(string: character.img) ?? URL(string: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")!
    }
}
