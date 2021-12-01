import XCTest
@testable import AOC2019
import AOCHelper

final class Day22Tests: XCTestCase {

    func testShuffleModeParsing() {
        XCTAssertEqual(ShuffleMode.parse("deal with increment 7"), ShuffleMode.dealWithIncrement(7))
        XCTAssertEqual(ShuffleMode.parse("cut -3"), ShuffleMode.cut(-3))
        XCTAssertEqual(ShuffleMode.parse("deal into new stack"), ShuffleMode.newStack)
    }

    func testNewStackShuffle() {
        let sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let shuffledSequence = sequence.newStack()

        XCTAssertEqual(shuffledSequence, [9, 8, 7, 6, 5, 4, 3, 2, 1, 0])
    }

    func testCutShuffle() {
        let sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let shuffledSequence = sequence.cut(3)
        XCTAssertEqual(shuffledSequence, [3, 4, 5, 6, 7, 8, 9, 0, 1, 2])

        let shuffledSequence2 = sequence.cut(-4)
        XCTAssertEqual(shuffledSequence2, [6, 7, 8, 9, 0, 1, 2, 3, 4, 5])
    }

    func testIncrementShuffle() {
        let sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        let shuffledSequence = sequence.dealWithIncrement(3)
        XCTAssertEqual(shuffledSequence, [0, 7, 4, 1, 8, 5, 2, 9, 6, 3])
    }

    func testInput1() {
        let input = """
        deal with increment 7
        deal into new stack
        deal into new stack
        """
        var sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        for instruction in input.split(separator: "\n") {
            let mode = ShuffleMode.parse(String(instruction))
            sequence = sequence.shuffle(with: mode)
        }
        XCTAssertEqual(sequence, [0, 3, 6, 9, 2, 5, 8, 1, 4, 7])
    }

    func testInput2() {
        let input = """
        cut 6
        deal with increment 7
        deal into new stack
        """
        var sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        for instruction in input.split(separator: "\n") {
            let mode = ShuffleMode.parse(String(instruction))
            sequence = sequence.shuffle(with: mode)
        }
        XCTAssertEqual(sequence, [3, 0, 7, 4, 1, 8, 5, 2, 9, 6])
    }

    func testInput3() {
        let input = """
        deal with increment 7
        deal with increment 9
        cut -2
        """
        var sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        for instruction in input.split(separator: "\n") {
            let mode = ShuffleMode.parse(String(instruction))
            sequence = sequence.shuffle(with: mode)
        }
        XCTAssertEqual(sequence, [6, 3, 0, 7, 4, 1, 8, 5, 2, 9])
    }

    func testInput4() {
        let input = """
        deal into new stack
        cut -2
        deal with increment 7
        cut 8
        cut -4
        deal with increment 7
        cut 3
        deal with increment 9
        deal with increment 3
        cut -1
        """
        var sequence = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        for instruction in input.split(separator: "\n") {
            let mode = ShuffleMode.parse(String(instruction))
            sequence = sequence.shuffle(with: mode)
        }
        XCTAssertEqual(sequence, [9, 2, 5, 8, 1, 4, 7, 0, 3, 6])
    }

    func testPart1() {
        var sequence = Array(0..<10007)
        XCTAssertEqual(sequence.first, 0)
        XCTAssertEqual(sequence.last, 10006)
        XCTAssertEqual(sequence.count, 10007)
        for instruction in input.split(separator: "\n") {
            let mode = ShuffleMode.parse(String(instruction))
            sequence = sequence.shuffle(with: mode)
        }

        let index = sequence.firstIndex { $0 == 2019 }
        let part1 = Int(index!)
        print("Solution of part 1: \(part1)")
        XCTAssertGreaterThan(part1, 4558)
        XCTAssertLessThan(part1, 8440)
        XCTAssertEqual(sequence.count, Set(sequence).count)
        XCTAssertEqual(part1, 6794)
    }

    func testPart2() {

//        let upperBound = UInt64(119315717514047)
//        let upperBound = UInt64(5)
//        var new: [UInt64] = Array()
//        new.reserveCapacity(Int.max)
//
//        var count = UInt64(0)
//        while count < upperBound {
//            new.append(count)
//            count += UInt64(1)
//        }
//        print(new)

//        var sequence: [UInt64] = Array(UInt64(0)..<UInt64(101_741_582_076_661))
//        let range: Range<UInt64> = UInt64(0)..<upperBound
//
//        for iteration in range {
//            for instruction in input.split(separator: "\n") {
//                let mode = ShuffleMode.parse(String(instruction))
//                sequence = sequence.shuffle(with: mode)
//            }
//        }
//        let part2 = sequence[2020]
//
//        print("Solution of part 2: \(part2)")
//        XCTAssertEqual(part2, 428576638953552)
    }

    let input = """
    deal into new stack
    cut 7990
    deal into new stack
    cut -5698
    deal with increment 29
    cut 1503
    deal with increment 65
    cut -9095
    deal with increment 56
    cut 9104
    deal into new stack
    deal with increment 5
    cut -7708
    deal with increment 20
    cut 4813
    deal with increment 2
    cut 4728
    deal into new stack
    cut -5429
    deal with increment 47
    cut 1739
    deal with increment 63
    cut 6707
    deal with increment 29
    cut 4293
    deal with increment 44
    cut 8873
    deal with increment 53
    cut 6046
    deal into new stack
    cut 8054
    deal into new stack
    deal with increment 14
    cut 2426
    deal with increment 11
    cut 4006
    deal with increment 49
    cut -6277
    deal with increment 3
    cut 2231
    deal with increment 45
    cut -5059
    deal with increment 7
    cut 4251
    deal with increment 16
    cut -6081
    deal with increment 25
    cut -4067
    deal with increment 29
    cut 7656
    deal into new stack
    cut 5091
    deal with increment 57
    deal into new stack
    deal with increment 63
    cut 4047
    deal with increment 24
    cut -8596
    deal with increment 13
    cut 1946
    deal with increment 16
    cut -1656
    deal into new stack
    deal with increment 15
    cut -6557
    deal with increment 10
    cut 2378
    deal with increment 24
    cut -2162
    deal with increment 7
    deal into new stack
    deal with increment 37
    cut -4310
    deal into new stack
    deal with increment 48
    cut 6842
    deal with increment 13
    cut 2960
    deal into new stack
    cut 7128
    deal with increment 30
    cut -2529
    deal with increment 31
    cut -2500
    deal with increment 28
    deal into new stack
    deal with increment 37
    cut -8133
    deal with increment 74
    cut -7823
    deal with increment 42
    cut 2092
    deal with increment 41
    cut -6752
    deal with increment 56
    cut -9577
    deal into new stack
    cut -4736
    deal with increment 8
    cut -3584
    """
}
