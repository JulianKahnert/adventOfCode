import XCTest
@testable import AOC2020

final class Day10Tests: XCTestCase {
    
    func testPart1() {
        let numbers = Self.testValues1Part1
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)
        
        let value = calculateJoltDifferences(from: numbers)

        XCTAssertEqual(value, 35)
    }
    
    func test2Part1() {
        let numbers = Self.testValues2Part1
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)
        
        let value = calculateJoltDifferences(from: numbers)

        XCTAssertEqual(value, 220)
    }
    
    func testResultPart1() {
        let numbers = Self.valuesPart1
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)
        
        let value = calculateJoltDifferences(from: numbers)

        XCTAssertEqual(value, 2312)
    }

    func testPart2() {
        let numbers = Self.testValues1Part1
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)

        let value = calculateAllCombinationsOfJoltAdapters(from: numbers)

        XCTAssertEqual(value, 8)
    }
    
    func test2Part2() {
        let numbers = Self.testValues2Part1
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)

        let value = calculateAllCombinationsOfJoltAdapters(from: numbers)

        XCTAssertEqual(value, 19208)
    }

    func testResultPart2() {
        let numbers = Self.valuesPart1
            .split(separator: "\n")
            .map(String.init)
            .compactMap(Int.init)

        let value = calculateAllCombinationsOfJoltAdapters(from: numbers)

        XCTAssertEqual(value, 12089663946752)
    }
}

extension Day10Tests {
    static let testValues1Part1: String = """
        16
        10
        15
        5
        1
        11
        7
        19
        6
        12
        4
        """

    static let testValues2Part1: String = """
        28
        33
        18
        42
        31
        14
        46
        20
        48
        47
        24
        23
        49
        45
        19
        38
        39
        11
        1
        32
        25
        35
        8
        17
        7
        9
        4
        2
        34
        10
        3
        """
    
    static let valuesPart1: String = """
        99
        151
        61
        134
        112
        70
        75
        41
        119
        137
        158
        50
        167
        60
        116
        117
        62
        82
        31
        3
        72
        88
        165
        34
        8
        14
        27
        108
        166
        71
        51
        42
        135
        122
        140
        109
        1
        101
        2
        77
        85
        76
        143
        100
        127
        7
        107
        13
        148
        118
        56
        159
        133
        21
        154
        152
        130
        78
        54
        104
        160
        153
        95
        49
        19
        69
        142
        63
        11
        12
        29
        98
        84
        28
        17
        146
        161
        115
        4
        94
        24
        126
        136
        91
        57
        30
        155
        79
        66
        141
        48
        125
        162
        37
        40
        147
        18
        20
        45
        55
        83
        """
}
