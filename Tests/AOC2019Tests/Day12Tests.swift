import XCTest
@testable import AOC2019
import AOCHelper

final class Day12Tests: XCTestCase {

    //        <x=3, y=15, z=8>
    //        <x=5, y=-1, z=-2>
    //        <x=-10, y=8, z=2>
    //        <x=8, y=4, z=-5>
    let input = [
        Point3(x: 3, y: 15, z: 8),
        Point3(x: 5, y: -1, z: -2),
        Point3(x: -10, y: 8, z: 2),
        Point3(x: 8, y: 4, z: -5),
    ]

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
    }

    func testTotalEnergy() {
        let positions = [
            Point3(x: -1, y: 0, z: 2),
            Point3(x: 2, y: -10, z: -7),
            Point3(x: 4, y: -8, z: 8),
            Point3(x: 3, y: 5, z: -1),
        ]
        var system = SolarSystem(positions: positions)
        XCTAssertEqual(system.velocities, [.zero, .zero, .zero, .zero])
        for _ in 0..<10 {
            system.step()
        }
        XCTAssertEqual(system.getTotalEnergy(), 179)
    }

    func testPositionRepeat() {
        let positions = [
            Point3(x: -1, y: 0, z: 2),
            Point3(x: 2, y: -10, z: -7),
            Point3(x: 4, y: -8, z: 8),
            Point3(x: 3, y: 5, z: -1),
        ]
        let steps = SolarSystem.stepsUntilNextRepeat(positions)
        XCTAssertEqual(steps, 2772)
    }

    func testPart1() {
        var system = SolarSystem(positions: input)
        XCTAssertEqual(system.velocities, [.zero, .zero, .zero, .zero])
        for _ in 0..<1000 {
            system.step()
        }
        let part1 = system.getTotalEnergy()
        print("Solution of part 1: \(part1)")
        XCTAssertEqual(part1, 7179)
    }

    func testPart2() {
        let part2 = SolarSystem.stepsUntilNextRepeat(input)

        print("Solution of part 2: \(part2)")
        XCTAssertEqual(part2, 428576638953552)
    }
}
