//
//  CharatersListTests.swift
//  swiftui-mvvmTests
//
//  Created by Abdeltawab Mohamed on 04/10/2022.
//

import XCTest
import Combine
import NetworkingKit
@testable import swiftui_mvvm

class CharatersListTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()
    private let fetchCharacters = FetchCharacters(service: MockCharactersService())
    private var sut: CharacterListViewModel!

    override func setUpWithError() throws {
       sut = CharacterListViewModel(fetchCharacters: fetchCharacters)
    }
    
    func test_LocalCharatersListIsValid() {
        let localList = fetchCharacters.execute()
       
        
//        let jsonData = Bundle.stubbedDataFromJson(filename: "Characters")
//        let decoder = JSONDecoder()
//        do {
//            let localList = try decoder.decode(CharacterList.self,
//                                               from: jsonData)
//            XCTAssertEqual(localList.count, 5)
//            XCTAssertNotNil(localList.first)
//            XCTAssertEqual(localList.first!.id, 1)
//            XCTAssertEqual(localList.first!.name, "Walter White")
//            XCTAssertEqual(localList.first!.birthday, "09-07-1958")
//
//        } catch {
//            XCTAssert(false, "Weather.json decode failed \(error)")
//        }
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
