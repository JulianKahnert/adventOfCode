import XCTest
@testable import AOC2019

final class Day4Tests: XCTestCase {

    let input = 147981...691423

    func testPart1() {
        let validNumbers = countValidNumber(in: input)
        print("Solution of part 1: \(validNumbers)")
        XCTAssertEqual(validNumbers, 1790)
    }

    func testPart2() {
        let validNumbers = input
            .map { String($0) }
            .filter { $0.sameDoubleDigits() }
            .filter { $0.neverDecreses() }
            .count
        print("Solution of part 2: \(validNumbers)")
        XCTAssertEqual(validNumbers, 1206)
    }
}
