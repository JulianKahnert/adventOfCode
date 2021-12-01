import XCTest
@testable import AOC2020

final class Day15Tests: XCTestCase {

    func testPart1() {
        let game = SpokenNumberGame(with: [0, 3, 6])

        XCTAssertEqual(game.getSpokenNumber(1), 0)
        XCTAssertEqual(game.getSpokenNumber(2), 3)
        XCTAssertEqual(game.getSpokenNumber(3), 6)

        XCTAssertEqual(game.getSpokenNumber(4), 0)
        XCTAssertEqual(game.getSpokenNumber(5), 3)
        XCTAssertEqual(game.getSpokenNumber(6), 3)
        XCTAssertEqual(game.getSpokenNumber(7), 1)
        XCTAssertEqual(game.getSpokenNumber(8), 0)
        XCTAssertEqual(game.getSpokenNumber(9), 4)
        XCTAssertEqual(game.getSpokenNumber(10), 0)
    }

    func test1Part1() {
        XCTAssertEqual(SpokenNumberGame(with: [1, 3, 2]).getSpokenNumber(2020), 1)
        XCTAssertEqual(SpokenNumberGame(with: [2, 1, 3]).getSpokenNumber(2020), 10)
        XCTAssertEqual(SpokenNumberGame(with: [1, 2, 3]).getSpokenNumber(2020), 27)
        XCTAssertEqual(SpokenNumberGame(with: [2, 3, 1]).getSpokenNumber(2020), 78)
        XCTAssertEqual(SpokenNumberGame(with: [3, 2, 1]).getSpokenNumber(2020), 438)
        XCTAssertEqual(SpokenNumberGame(with: [3, 1, 2]).getSpokenNumber(2020), 1836)
    }

    func testResultPart1() {
        let values = Self.valuesPart1
            .split(separator: ",")
            .map(String.init)
            .compactMap(Int.init)

        XCTAssertEqual(SpokenNumberGame(with: values).getSpokenNumber(2020), 1373)
    }

//    func testPart2() {
//        XCTAssertEqual(SpokenNumberGame(with: [0, 3, 6]).getSpokenNumber(30000000), 175594)
//        XCTAssertEqual(SpokenNumberGame(with: [1, 3, 2]).getSpokenNumber(30000000), 2578)
//        XCTAssertEqual(SpokenNumberGame(with: [2, 1, 3]).getSpokenNumber(30000000), 3544142)
//        XCTAssertEqual(SpokenNumberGame(with: [1, 2, 3]).getSpokenNumber(30000000), 261214)
//        XCTAssertEqual(SpokenNumberGame(with: [2, 3, 1]).getSpokenNumber(30000000), 6895259)
//        XCTAssertEqual(SpokenNumberGame(with: [3, 2, 1]).getSpokenNumber(30000000), 18)
//        XCTAssertEqual(SpokenNumberGame(with: [3, 1, 2]).getSpokenNumber(30000000), 362)
//    }

    func testResultPart2() {
        let values = Self.valuesPart1
            .split(separator: ",")
            .map(String.init)
            .compactMap(Int.init)
        let value = SpokenNumberGame(with: values).getSpokenNumber(30000000)
        XCTAssert(value > 1373)
        XCTAssertEqual(value, 100373)
    }
}

extension Day15Tests {
    static let valuesPart1: String = """
    0,1,5,10,3,12,19
    """
}
