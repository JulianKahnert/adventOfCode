import XCTest
@testable import AOC2019

final class Day2Tests: XCTestCase {

    let input = [1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 10, 1, 19, 1, 19, 6, 23, 2, 13, 23, 27, 1, 27, 13, 31, 1, 9, 31, 35, 1, 35, 9, 39, 1, 39, 5, 43, 2, 6, 43, 47, 1, 47, 6, 51, 2, 51, 9, 55, 2, 55, 13, 59, 1, 59, 6, 63, 1, 10, 63, 67, 2, 67, 9, 71, 2, 6, 71, 75, 1, 75, 5, 79, 2, 79, 10, 83, 1, 5, 83, 87, 2, 9, 87, 91, 1, 5, 91, 95, 2, 13, 95, 99, 1, 99, 10, 103, 1, 103, 2, 107, 1, 107, 6, 0, 99, 2, 14, 0, 0]

    private func transform(input: [Int]) -> [Int] {
        var code = Intcode(memory: input)
        code.run()
        return code.memory
    }

    func testGivenInput() {
        XCTAssertEqual(transform(input: [1, 0, 0, 0, 99]), [2, 0, 0, 0, 99])
        XCTAssertEqual(transform(input: [2, 3, 0, 3, 99]), [2, 3, 0, 6, 99])
        XCTAssertEqual(transform(input: [2, 4, 4, 5, 99, 0]), [2, 4, 4, 5, 99, 9801])
        XCTAssertEqual(transform(input: [1, 1, 1, 4, 99, 5, 6, 0, 99]), [30, 1, 1, 4, 2, 5, 6, 0, 99])
    }

    func testPart1() {
        print("Solution of part 1: \(part1(input))")
        XCTAssertEqual(part1(input), 2842648)
    }

    func testPart11() {

        var sequenceInput = input
        sequenceInput[1] = 12
        sequenceInput[2] = 2

        var code = Intcode(memory: sequenceInput, index: 0)
        code.run()

        print("Solution of part 1: \(code.io)")
        XCTAssertEqual(code.io, 2842648)
    }

    func testPart2() {
        print("Solution of part 2: \(part2(input))")
        XCTAssertEqual(part2(input), 9074)
    }
}
