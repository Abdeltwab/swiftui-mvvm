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

    func test_LocalCharatersListIsValid() {
//        let expectation = XCTestExpectation(description: "Publishes values then finishe")
//        var expectedList: [CharacterUIModel] = []
//    
//        
//        fetchCharacters.execute()
//            .sink { completion in
//                guard case .finished = completion else { return }
//                expectation.fulfill()
//            } receiveValue: {
//                expectedList.append(contentsOf: $0)
//            }
//            .store(in: &cancellables)
//        wait(for: [expectation], timeout: 0.5)
//        XCTAssertEqual(expectedList.count, 5)
//        XCTAssertNotNil(expectedList.first)
//        XCTAssertEqual(expectedList.first!.id, 1)
//        XCTAssertEqual(expectedList.first!.character.name, "Walter White")
//        XCTAssertEqual(expectedList.first!.character.birthday, "09-07-1958")
    }
    
    func test_emptyFilterdList() {
        sut.searchText = "jsess"
        print("sut.charactersList.count")
        print(sut.charactersList.count)
        XCTAssertEqual(sut.charactersList.count, 5)
    }

    override func tearDown() {
        sut = nil
    }
}
