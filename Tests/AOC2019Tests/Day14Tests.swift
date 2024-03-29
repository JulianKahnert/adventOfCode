import XCTest
@testable import AOC2019
import AOCHelper

final class Day14Tests: XCTestCase {

    func testInput1() {
        let input = """
        9 ORE => 2 A
        8 ORE => 3 B
        7 ORE => 5 C
        3 A, 4 B => 1 AB
        5 B, 7 C => 1 BC
        4 C, 1 A => 1 CA
        2 AB, 3 BC, 4 CA => 1 FUEL
        """
        var factory = NanoFactory(input: input)
        let reactions = factory.parse()

        let num = factory.getNumInputs()

        print(num)
//        XCTAssertEqual(num, 165)
    }

    func testPart1() {
//        var sequence = Array(0..<10007)
//        XCTAssertEqual(sequence.first, 0)
//        XCTAssertEqual(sequence.last, 10006)
//        XCTAssertEqual(sequence.count, 10007)
//        for instruction in input.split(separator: "\n") {
//            let mode = ShuffleMode.parse(String(instruction))
//            sequence = sequence.shuffle(with: mode)
//        }
//
//        let index = sequence.firstIndex { $0 == 2019 }
//        let part1 = Int(index!)
//        print("Solution of part 1: \(part1)")
//        XCTAssertEqual(part1, 6794)
    }

    func testPart2() {
//        let part2 = sequence[2020]
//
//        print("Solution of part 2: \(part2)")
//        XCTAssertEqual(part2, 428576638953552)
    }

    let input = """
    9 RJLWC, 9 RJCH => 9 QWFH
    1 XZVHQ, 9 SPQR, 2 WKGVW => 5 KPZB
    12 HPRPM, 4 GTZCK => 7 DJNDX
    7 JKRV, 3 FKTLR, 19 FDSBZ => 9 HPRPM
    9 VTCRJ => 4 SPSW
    2 FDSBZ, 1 FKTLR => 6 KBJF
    9 SPSW => 9 QHVSJ
    5 TFPNF, 11 MNMBX, 1 QCMJ, 13 TXPL, 1 DJNDX, 9 XZVHQ, 2 WKGVW, 2 VQPX => 8 GPKR
    10 DWTC, 8 DSPJG => 4 QCMJ
    100 ORE => 9 XZDP
    3 DBRBD => 4 DKRX
    37 JKRV, 5 FKTLR => 7 VXZN
    3 HWDS, 2 ZRBN => 8 XZVHQ
    15 QNXZV, 53 VXZN, 3 LJQH, 13 FKXVQ, 6 DZGN, 17 MNMBX, 16 GPKR, 8 HWJVK => 1 FUEL
    8 GSLWP => 7 PWTFL
    4 HVPWG => 9 JKRV
    5 NVWGS, 1 QWFH, 9 CWZRS => 2 XPMV
    6 ZRBN => 4 JZDB
    36 BWXWC, 14 HKFD => 3 FMNK
    3 FMNK, 2 SPSW, 16 WKGVW => 6 VQPX
    1 DWTC => 9 VMHM
    3 HPRPM, 1 DWTC => 5 TXPL
    1 KBJF, 2 ZSKSW => 1 MNMBX
    5 JZDB => 4 FDSBZ
    2 FKXVQ => 9 ZTFZG
    17 XZDP => 2 HKFD
    7 VMHM => 3 FGQF
    1 JKRV => 8 CWZRS
    1 WKGVW, 2 SPSW => 6 VLQP
    3 ZRBN => 3 ZSKSW
    7 VXZN, 7 TGLHX => 5 NVWGS
    10 VLQP, 18 FGQF => 4 DBRBD
    8 VMHM => 8 SPQR
    1 KPZB, 4 GQGB, 3 WKGVW => 1 FDSZX
    2 VXZN => 8 VTCRJ
    3 RJLWC => 2 GQGB
    6 TXPL => 4 DSPJG
    2 ZTFZG => 8 TJLW
    1 MPSPS => 3 BWXWC
    5 FMNK, 4 ZSKSW => 5 RWKWD
    137 ORE => 3 MPSPS
    1 VTCRJ, 8 QWFH => 2 GKVQK
    8 RJLWC => 8 TFPNF
    7 TJLW, 1 TFPNF, 16 VQPX, 4 DBRBD, 4 GTZCK, 5 XPMV, 1 FDSZX => 6 DZGN
    1 HVPWG => 7 RJLWC
    18 HVPWG, 9 BWXWC => 4 GSLWP
    107 ORE => 8 RJCH
    1 RJCH => 2 ZRBN
    2 GSLWP, 18 RWKWD, 1 QWFH => 5 LJQH
    3 VXZN, 1 FMNK => 4 TGLHX
    3 HKFD, 6 FMNK => 3 FKTLR
    3 MPSPS => 4 HVPWG
    27 PWTFL, 15 ZTFZG, 6 QHVSJ, 14 DJNDX, 9 RWKWD, 2 MNMBX, 4 DKRX => 6 QNXZV
    1 ZSKSW, 9 KBJF => 3 FKXVQ
    2 FDSBZ => 4 DWTC
    3 HPRPM => 5 HWDS
    1 GKVQK, 1 PWTFL => 5 GTZCK
    1 FGQF => 5 WKGVW
    5 FDSBZ, 7 SPSW => 6 HWJVK
    """
}
