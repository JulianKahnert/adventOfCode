import Foundation
import AOCHelper

struct SolarSystem {

    struct Snapshot: Hashable {
        let p: Array<Int>
        let v: Array<Int>
    }

    var positions: [Point3]
    var velocities: [Point3]
    
    private let dims: [WritableKeyPath<Point3, Int>] = [\.x, \.y, \.z]
    
    init(positions: [Point3]) {
        self.positions = positions
        self.velocities = positions.map { _ in .zero }
    }
    
    mutating func step() {
        let indices = positions.map { positions.firstIndex(of: $0)! }
        for pair in indices.combinations(count: 2) where pair[0] != pair[1] {
            let moon1 = pair[0]
            let moon2 = pair[1]
            for dim in dims {
                
                // calculate new velocities
                if positions[moon1][keyPath: dim] < positions[moon2][keyPath: dim] {
                    velocities[moon1][keyPath: dim] += 1
                    velocities[moon2][keyPath: dim] -= 1
                } else if positions[moon1][keyPath: dim] > positions[moon2][keyPath: dim] {
                    velocities[moon1][keyPath: dim] -= 1
                    velocities[moon2][keyPath: dim] += 1
                }
            }
        }
        
        // calculate new positions
        for moonIndex in 0..<positions.count {
            for dim in dims {
                positions[moonIndex][keyPath: dim] += velocities[moonIndex][keyPath: dim]
            }
        }
    }
    
    func getTotalEnergy() -> Int {
        var value = 0
        for index in 0..<positions.count {
            let positionMagnitude = positions[index].getManitude()
            let velocitiesMagnitude = velocities[index].getManitude()
            value += positionMagnitude * velocitiesMagnitude
        }
        return value
    }

    func snapshot(axis: Int) -> Snapshot {
        let dim = dims[axis]
        return Snapshot(p: positions.map { $0[keyPath: dim] },
                        v: velocities.map { $0[keyPath: dim] })
    }

    static func stepsUntilNextRepeat(_ initialPositions: [Point3]) -> Int {
        var system = SolarSystem(positions: initialPositions)
        var snapshots: Array<Set<Snapshot>> = [[], [], []]
        var periods: Array<UInt?> = [nil, nil, nil]

        var stepCount: UInt = 0
        while !periods.allSatisfy({ $0 != nil }) {


            for axis in 0 ..< 3 {
                guard periods[axis] == nil else { continue }
                let snapshot = system.snapshot(axis: axis)
                if snapshots[axis].contains(snapshot) {
                    periods[axis] = stepCount
                } else {
                    snapshots[axis].insert(snapshot)
                }
            }

            system.step()
            stepCount += 1
        }

        let p = periods.compactMap {$0}
        return Int(lcm(of: p))
    }
}

extension Point3 {
    func getManitude() -> Int {
        abs(x) + abs(y) + abs(z)
    }
}
