import XCTest
import Combine
@testable import NetworkingKit

final class NetworkingKitTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    
    func test_characters_list_parsing() throws {
        let service = MockCharactersService()
        let expectation = XCTestExpectation(description: "Publishes values then finishe")
        var expectedList: [Character] = []
        service.fetchCharacters()
            .sink { completion in
                guard case .finished = completion else { return }
                expectation.fulfill()
            } receiveValue: {
                expectedList.append(contentsOf: $0)
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 0.5)
        XCTAssertNotNil(expectedList.first)
        XCTAssertEqual(expectedList.first!.id, 1)
        XCTAssertEqual(expectedList.first!.name, "Walter White")
        XCTAssertEqual(expectedList.first!.birthday, "09-07-1958")
    }
}
