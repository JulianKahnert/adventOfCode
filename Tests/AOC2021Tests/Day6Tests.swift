import XCTest
@testable import AOC2021

final class Day6Tests: XCTestCase {

    func testPart1() {
        let result = calculateFish(afterDays: 18, initial: Self.testValuesPart1)
        XCTAssertEqual(result, 26)
    }

	func testResultPart1() {
        let result = calculateFish(afterDays: 80, initial: Self.valuesPart1)

        print("Solution of part 1: \(result)")
        XCTAssertEqual(result, 380758)
	}

    func testPart2() {
        let result = calculateFish(afterDays: 256, initial: Self.testValuesPart1)
        XCTAssertEqual(result, 26984457539)
    }

    func testResultPart2() {
        let result = calculateFish(afterDays: 256, initial: Self.valuesPart1)

        print("Solution of part 1: \(result)")
        XCTAssertEqual(result, 1710623015163)
    }
}

extension Day6Tests {
    static let testValuesPart1 = [3,4,3,1,2]

    static let valuesPart1 = [
        3,3,2,1,4,1,1,2,3,1,1,2,1,2,1,1,1,1,1,1,4,1,1,5,2,1,1,2,1,1,1,3,5,1,5,5,1,1,1,1,3,1,1,3,2,1,1,1,1,1,1,4,1,1,1,1,1,1,1,4,1,3,3,1,1,3,1,3,1,2,1,3,1,1,4,1,2,4,4,5,1,1,1,1,1,1,4,1,5,1,1,5,1,1,3,3,1,3,2,5,2,4,1,4,1,2,4,5,1,1,5,1,1,1,4,1,1,5,2,1,1,5,1,1,1,5,1,1,1,1,1,3,1,5,3,2,1,1,2,2,1,2,1,1,5,1,1,4,5,1,4,3,1,1,1,1,1,1,5,1,1,1,5,2,1,1,1,5,1,1,1,4,4,2,1,1,1,1,1,1,1,3,1,1,4,4,1,4,1,1,5,3,1,1,1,5,2,2,4,2,1,1,3,1,5,5,1,1,1,4,1,5,1,1,1,4,3,3,3,1,3,1,5,1,4,2,1,1,5,1,1,1,5,5,1,1,2,1,1,1,3,1,1,1,2,3,1,2,2,3,1,3,1,1,4,1,1,2,1,1,1,1,3,5,1,1,2,1,1,1,4,1,1,1,1,1,2,4,1,1,5,3,1,1,1,2,2,2,1,5,1,3,5,3,1,1,4,1,1,4
    ]
    
}
