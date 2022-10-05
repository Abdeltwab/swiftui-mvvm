//
//  CharatersListTests.swift
//  swiftui-mvvmTests
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import Combine
import NetworkingKit
@testable import swiftui_mvvm
import XCTest

class CharatersListTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()
    private let fetchCharacters = FetchCharacters(service: MockCharactersService())
    private var sut: CharacterListViewModel!

    override func setUp()  {
        sut = CharacterListViewModel(fetchCharacters: FetchCharacters(service: MockCharactersService()))
    }
    
    func test_fetch_charactersList() {
        XCTAssertEqual(sut.charactersList.count, 5)
    }
    
    func test_fetch_charactersList() {
        XCTAssertEqual(sut.charactersList.count, 5)
    }

    override func tearDown() {
        sut = nil
    }
}
