import XCTest
@testable import Day2

final class Day2Tests: XCTestCase {

    func testGivenInput() {
        XCTAssertEqual(transform(input: [1, 0, 0, 0, 99]), [2, 0, 0, 0, 99])
        XCTAssertEqual(transform(input: [2,3,0,3,99]), [2,3,0,6,99])
        XCTAssertEqual(transform(input: [2,4,4,5,99,0]), [2,4,4,5,99,9801])
        XCTAssertEqual(transform(input: [1,1,1,4,99,5,6,0,99]), [30,1,1,4,2,5,6,0,99])
    }

    func testPart1() {
        print("Solution of part 1: \(part1())")
    }

    func testPart2() {
        print("Solution of part 2: \(part2())")
    }
}
