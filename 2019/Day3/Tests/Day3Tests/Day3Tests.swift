import XCTest
@testable import Day3

final class Day3Tests: XCTestCase {


    func testInput1() {
        XCTAssertEqual(getMinDistance(of: ["R8","U5","L5","D3"], and: ["U7","R6","D4","L4"]), 6)
        XCTAssertEqual(getMinDistance(of: ["R75","D30","R83","U83","L12","D49","R71","U7","L72"], and: ["U62","R66","U55","R34","D71","R55","D58","R83"]), 159)
        XCTAssertEqual(getMinDistance(of: ["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"], and: ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]), 135)
    }

    func testPart1() {
        print("Solution of part 1: \(part1())")
    }


    // MARK: - Part 2

    func testInput2() {
        XCTAssertEqual(getMinSteps(of: ["R75","D30","R83","U83","L12","D49","R71","U7","L72"], and: ["U62","R66","U55","R34","D71","R55","D58","R83"]), 610)
        XCTAssertEqual(getMinSteps(of: ["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"], and: ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]), 410)
    }

    func testPart2() {
        print("Solution of part 2: \(part2())")
    }
}
