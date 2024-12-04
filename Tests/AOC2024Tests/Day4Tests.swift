import Testing
@testable import AOC2024

@Suite("Day4")
struct Day4Tests {

    @Test("Day4 Part 1 Example")
    func testPart1() {
        let result = day4Part1(Self.testInputPart1)
        #expect(result == 42)
    }

    @Test("Day4 Part 1")
	func testResultPart1() {
        let result = day4Part1(Self.inputPart1)

        print("Solution of part 1: \(result)")
        #expect(result == 42)
	}

    @Test("Day4 Part 2 Example")
    func testPart2() {
        let result = day4Part2(Self.testInputPart2)
        #expect(result == 42)
    }
    
    @Test("Day4 Part 2")
    func testResultPart2() {
        let result = day4Part2(Self.inputPart2)

        print("Solution of part 2: \(result)")
        #expect(result == 42)
    }

    static let testInputPart1 = """
        """
    
    static let inputPart1 = """
        """
    
    static let testInputPart2 = """
        """
    
    static let inputPart2 = """
        """
}
