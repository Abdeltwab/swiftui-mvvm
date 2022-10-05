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
    
    func test_intial_State() {
        XCTAssertEqual(sut.charactersList.count, 5)
        XCTAssertEqual(sut.filteredList.count, 0)
    }
    
    func test_empty_search_query_with_debounce() {
        let expectation = XCTestExpectation(description: "List Filterd after 0.3 debounce ")
        sut.searchText = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
        XCTAssertEqual(sut.filteredList.count, sut.charactersList.count)
    }
    
    func test_search_charactersList_with_debounce() {
        let expectation = XCTestExpectation(description: "List Filterd after 0.3 debounce ")
        sut.searchText = "wa"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.3)
        XCTAssertEqual(sut.filteredList.count, 2)
    }
    
    func test_select_charcter_from_list() {
        sut.selectedCharacter = sut.charactersList.first
    }

    override func tearDown() {
        sut = nil
    }
}
