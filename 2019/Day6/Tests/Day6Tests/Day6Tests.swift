import XCTest
@testable import Day6

final class Day6Tests: XCTestCase {

    func testInput1() {
        let testInput = """
        COM)B
        B)C
        C)D
        D)E
        E)F
        B)G
        G)H
        D)I
        E)J
        J)K
        K)L
        """.components(separatedBy: .whitespacesAndNewlines)
        
        let calc = OrbitCalculator(orbits: testInput)
        XCTAssertEqual(calc.calculateOrbitCount(), 42)
    }

    func testPart1() {
        let calc = OrbitCalculator(orbits: input)
        let part1 = calc.calculateOrbitCount()
        print("Solution of part 1: \(part1)")
        XCTAssertEqual(part1, 171213)
    }
    
    func testInput2() {
        let testInput = """
        COM)B
        B)C
        C)D
        D)E
        E)F
        B)G
        G)H
        D)I
        E)J
        J)K
        K)L
        K)YOU
        I)SAN
        """.components(separatedBy: .whitespacesAndNewlines)
        
        let calc = OrbitCalculator(orbits: testInput)
        XCTAssertEqual(calc.calculateMinTransfers(), 4)
    }

    func testPart2() {
        let calc = OrbitCalculator(orbits: input)
        let part2 = calc.calculateMinTransfers()
        print("Solution of part 2: \(part2)")
    }
}
