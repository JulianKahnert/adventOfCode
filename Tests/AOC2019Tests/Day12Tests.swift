import XCTest
@testable import AOC2019
import AOCHelper

final class Day12Tests: XCTestCase {

    func testInput1() {
        
//        <x=-1, y=0, z=2>
//        <x=2, y=-10, z=-7>
//        <x=4, y=-8, z=8>
//        <x=3, y=5, z=-1>
        let positions = [
            Point3(x: -1, y: 0, z: 2),
            Point3(x: 2, y: -10, z: -7),
            Point3(x: 4, y: -8, z: 8),
            Point3(x: 3, y: 5, z: -1),
        ]
        var system = SolarSystem(positions: positions)
        XCTAssertEqual(system.velocities, [.zero, .zero, .zero, .zero])
        system.step()
        
        
        let newPositions = [
            Point3(x: 2, y: -1, z: 1),
            Point3(x: 3, y: -7, z: -4),
            Point3(x: 1, y: -7, z: 5),
            Point3(x: 2, y: 2, z: 0),
        ]
        
        let newVelocities = [
            Point3(x: 3, y: -1, z: -1),
            Point3(x: 1, y: 3, z: 3),
            Point3(x: -3, y: 1, z: -3),
            Point3(x: -1, y: -3, z: 1),
        ]
        
        XCTAssertEqual(system.positions, newPositions)
        XCTAssertEqual(system.velocities, newVelocities)
//        XCTAssertEqual(point1.angle(to: point2).value * 180 / Double.pi, 45.0)
    }

//    func testPart1() {
//        let analyzer = MapAnalyzer(map: input)
//        let part1 = analyzer.getMaxAstroidsInSight()!
//
//        print("Solution of part 1: \(part1)")
//        XCTAssertEqual(part1, 296)
//    }
//
//    func testPart2() {
//        let analyzer = MapAnalyzer(map: input)
//        let point = analyzer.vaporize(200)!
//        let part2 = point.x * 100 + point.y
//
//        print("Solution of part 2: \(part2)")
//        XCTAssertEqual(part2, 204)
//    }
}
