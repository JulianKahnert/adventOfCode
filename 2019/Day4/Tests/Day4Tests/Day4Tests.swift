import XCTest
@testable import Day4

final class Day4Tests: XCTestCase {

    func testInput1() {
        XCTAssertEqual(countValidNumber(in: 111111...111111), 1)
        XCTAssertEqual(countValidNumber(in: 223450...223450), 0)
        XCTAssertEqual(countValidNumber(in: 123789...123789), 0)
    }


    func testPart1() {
        print("Solution of part 1: \(part1())")
    }


    func testInput2() {
        XCTAssertEqual("112233".sameDoubleDigits(), true)
        XCTAssertEqual("123444".sameDoubleDigits(), false)
        XCTAssertEqual("111122".sameDoubleDigits(), true)
    }

    func testPart2() {
        print("Solution of part 2: \(part2())")
    }
}
