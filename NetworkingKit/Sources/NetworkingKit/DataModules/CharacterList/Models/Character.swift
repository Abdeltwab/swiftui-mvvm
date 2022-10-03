//
//  File.swift
//  
//
//  Created by Abdeltawab Mohamed on 03/10/2022.
//

import Foundation

public typealias CharacterList = [Character]

public struct Character: Codable {
    public let id: Int
    public let name: String
    public let birthday: String
    public let occupation: [String]
    public let img: String
    public let status: Status
    public let nickname: String
    public let appearance: [Int]
    public let portrayed: String
    public let category: Category
    public let betterCallSaulAppearance: [Int]

    enum CodingKeys: String, CodingKey {
        case name, birthday,
             occupation, img,
             status, nickname,
             appearance, portrayed,
             category
        case id = "char_id"
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}

public enum Category: String, Codable {
    case betterCallSaul = "Better Call Saul"
    case breakingBad = "Breaking Bad"
    case breakingBadBetterCallSaul = "Breaking Bad, Better Call Saul"
}

public enum Status: String, Codable {
    case alive = "Alive"
    case deceased = "Deceased"
    case presumedDead = "Presumed dead"
    case unknown = "Unknown"
}


