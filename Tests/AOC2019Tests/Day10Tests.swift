import XCTest
@testable import AOC2019

final class Day10Tests: XCTestCase {

    private let input = """
    .###..#######..####..##...#
    ########.#.###...###.#....#
    ###..#...#######...#..####.
    .##.#.....#....##.#.#.....#
    ###.#######.###..##......#.
    #..###..###.##.#.#####....#
    #.##..###....#####...##.##.
    ####.##..#...#####.#..###.#
    #..#....####.####.###.#.###
    #..#..#....###...#####..#..
    ##...####.######....#.####.
    ####.##...###.####..##....#
    #.#..#.###.#.##.####..#...#
    ..##..##....#.#..##..#.#..#
    ##.##.#..######.#..#..####.
    #.....#####.##........#####
    ###.#.#######..#.#.##..#..#
    ###...#..#.#..##.##..#####.
    .##.#..#...#####.###.##.##.
    ...#.#.######.#####.#.####.
    #..##..###...###.#.#..#.#.#
    .#..#.#......#.###...###..#
    #.##.#.#..#.#......#..#..##
    .##.##.##.#...##.##.##.#..#
    #.###.#.#...##..#####.###.#
    #.####.#..#.#.##.######.#..
    .#.#####.##...#...#.##...#.
    """

    func testInput1() {
        let root = MapAnalyzer.Point(x: 0, y: 0)
        let point1 = MapAnalyzer.Point(x: 1, y: 1)
        let point2 = MapAnalyzer.Point(x: 3, y: 3)

        XCTAssertEqual(root.angle(to: point1).value * 180 / Double.pi, 45.0)
        XCTAssertEqual(point1.angle(to: point2).value * 180 / Double.pi, 45.0)

        XCTAssertEqual(root.angle(to: point1).converted(to: .degrees).value, 45.0)
        XCTAssertEqual(point1.angle(to: point2).converted(to: .degrees).value, 45.0)
    }

    func testInput2() {
        let mapData = """
        .#..#
        .....
        #####
        ....#
        ...##
        """
        let referenceCountMap = """
        .7..7
        .....
        67775
        ....7
        ...87
        """

        let analyzer = MapAnalyzer(map: mapData)
        let countMap = analyzer.createCountMap()
        XCTAssertEqual(countMap, referenceCountMap)
        XCTAssertEqual(analyzer.getMaxAstroidsInSight(), 8)
    }

    func testInput3() {
        let mapData = """
        ......#.#.
        #..#.#....
        ..#######.
        .#.#.###..
        .#..#.....
        ..#....#.#
        #..#....#.
        .##.#..###
        ##...#..#.
        .#....####
        """

        let analyzer = MapAnalyzer(map: mapData)
        XCTAssertEqual(analyzer.getMaxAstroidsInSight(), 33)
    }

    func testInput4() {
        let mapData = """
        #.#...#.#.
        .###....#.
        .#....#...
        ##.#.#.#.#
        ....#.#.#.
        .##..###.#
        ..#...##..
        ..##....##
        ......#...
        .####.###.
        """

        let analyzer = MapAnalyzer(map: mapData)
        XCTAssertEqual(analyzer.getMaxAstroidsInSight(), 35)
    }

    func testInput5() {
        let mapData = """
        .#..#..###
        ####.###.#
        ....###.#.
        ..###.##.#
        ##.##.#.#.
        ....###..#
        ..#.#..#.#
        #..#.#.###
        .##...##.#
        .....#.#..
        """

        let analyzer = MapAnalyzer(map: mapData)
        XCTAssertEqual(analyzer.getMaxAstroidsInSight(), 41)
    }

    func testInput6() {
        let mapData = """
        .#..##.###...#######
        ##.############..##.
        .#.######.########.#
        .###.#######.####.#.
        #####.##.#.##.###.##
        ..#####..#.#########
        ####################
        #.####....###.#.#.##
        ##.#################
        #####.##.###..####..
        ..######..##.#######
        ####.##.####...##..#
        .#####..#.######.###
        ##...#.##########...
        #.##########.#######
        .####.#.###.###.#.##
        ....##.##.###..#####
        .#.#.###########.###
        #.#.#.#####.####.###
        ###.##.####.##.#..##
        """

        let analyzer = MapAnalyzer(map: mapData)
        XCTAssertEqual(analyzer.getMaxAstroidsInSight(), 210)

        XCTAssertEqual(analyzer.vaporize(200), MapAnalyzer.Point(x: 8, y: 2))
    }

    func testInput7() {
        let root = MapAnalyzer.Point(x: 0, y: 0)
        let point1 = MapAnalyzer.Point(x: 0, y: 1)
        let point2 = MapAnalyzer.Point(x: 1, y: 0)

        XCTAssertEqual(root.angle(to: point2).value * 180 / Double.pi, 0.0)
        XCTAssertEqual(root.angle(to: point1).value * 180 / Double.pi, 90.0)
    }

    func testPart1() {
        let analyzer = MapAnalyzer(map: input)
        let part1 = analyzer.getMaxAstroidsInSight()!

        print("Solution of part 1: \(part1)")
        XCTAssertEqual(part1, 296)
    }

    func testPart2() {
        let analyzer = MapAnalyzer(map: input)
        let point = analyzer.vaporize(200)!
        let part2 = point.x * 100 + point.y

        print("Solution of part 2: \(part2)")
        XCTAssertEqual(part2, 204)
    }
}
