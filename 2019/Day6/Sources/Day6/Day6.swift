import Foundation

struct OrbitCalculator {
    
    init(orbits: [String]) {
        mapping = OrbitCalculator.mapOrbits(orbits)
    }

    private let mapping: [String: String]
    
    // MARK: - Part 1
    func calculateOrbitCount() -> Int {
        var count = 0
        for (key, _) in mapping {
            count += getOrbits(from: key).count
        }
        return count
    }
    
    // MARK: - Part 2
    func calculateMinTransfers() -> Int {
        
        let myWay = Set(getOrbits(from: "YOU"))
        let santasWay = Set(getOrbits(from: "SAN"))
        let sameWay = myWay.intersection(santasWay)
        
        return myWay.count + santasWay.count - sameWay.count - sameWay.count
    }
    
    private func getOrbits(from orbit: String) -> [String] {
        var orbits = [String]()
        var currentOrbit = mapping[orbit]
        while currentOrbit != nil {
            orbits.append(currentOrbit!)
            currentOrbit = mapping[currentOrbit!]
        }
        return orbits
    }
    
    private static func mapOrbits(_ inputs: [String]) -> [String: String] {
        
        var mapping = [String: String]()
        
        for input in inputs {
            let components = input.components(separatedBy: ")")
            guard let lhs = components.first,
                let rhs = components.last else { fatalError() }
            
            mapping[rhs] = lhs
        }
        
        return mapping
    }
}
