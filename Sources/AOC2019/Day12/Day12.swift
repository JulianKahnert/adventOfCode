import Foundation
import AOCHelper

struct SolarSystem {
    var positions: [Point3]
    var velocities: [Point3]
    
    private let dims: [WritableKeyPath<Point3, Int>] = [\.x, \.y, \.z]
    
    init(positions: [Point3]) {
        self.positions = positions
        self.velocities = positions.map { _ in .zero }
    }
    
    mutating func step() {
        let indices = positions.map { positions.firstIndex(of: $0)! }
        for pair in positions.combinations(n: indices, k: 2) where pair[0] != pair[1] {
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
        let potentialEnergy = positions.map({ $0.getManitude() }).reduce(0, +)
        let kineticEnergy = velocities.map({ $0.getManitude() }).reduce(0, +)
        return potentialEnergy * kineticEnergy
    }
}

extension Point3 {
    func getManitude() -> Int {
        abs(x) + abs(y) + abs(z)
    }
}
