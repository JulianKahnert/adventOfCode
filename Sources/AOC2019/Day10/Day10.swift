import Foundation

struct MapAnalyzer {

    var astroids: Set<Point>
    let width: Int
    let height: Int

    private static let asteroidCharacter: Character = "#"

    init(map mapData: String) {
        let rows = mapData.split(separator: "\n")
        astroids = MapAnalyzer.createAstroidSet(from: rows)
        width = rows[0].count
        height = rows.count
    }

    private static func createAstroidSet(from rows: [Substring]) -> Set<Point> {
        var astroids = Set<Point>()
        for (rowIndex, row) in rows.enumerated() {
            for (index, character) in row.enumerated() {
                if character == asteroidCharacter {
                    astroids.insert(Point(x: index, y: rowIndex))
                }
            }
        }
        return astroids
    }

    func createCountMap() -> String {
        var rows = String(repeating: ".", count: width * height).split(by: width)
        for astroid in astroids {
            let num = getNumOfAstroidsInSight(from: astroid)
            var row = rows[astroid.y]
            let astroidIndex = row.index(row.startIndex, offsetBy: astroid.x)
            row.remove(at: astroidIndex)
            row.insert(contentsOf: String(num), at: astroidIndex)
            rows[astroid.y] = row
        }
        return rows.joined(separator: "\n")
    }

    func getMaxAstroidsInSight() -> Int? {
        astroids
            .map { getNumOfAstroidsInSight(from: $0) }
            .max()
    }

    func vaporize(_ number: Int = 200) -> Point? {

        let astroidsInSightCount = astroids.map { getNumOfAstroidsInSight(from: $0) }
        let sortedAstroids = zip(astroidsInSightCount, Array(self.astroids))
            .sorted { $0.0 > $1.0 }
            .map { $0.1 }
        let instantMonitoringStation = sortedAstroids.first!
        let astroids = Array(self.astroids.subtracting([instantMonitoringStation]))

        var count = 0
        var astroidsGroupedByAngle = Dictionary(grouping: astroids) { astroid -> Double in
            var angle = instantMonitoringStation.angle(to: astroid).converted(to: .degrees).value

            // start "up"
            angle += 90.0

            if angle < 0.0 {
                angle += 360.0
            }
            return angle

        }
        while astroidsGroupedByAngle.keys.count > 0 {
            for angle in astroidsGroupedByAngle.keys.sorted(by: <) {
                print("Angle: \(angle)")
                print(astroidsGroupedByAngle.count)
                guard var points = astroidsGroupedByAngle[angle] else { fatalError() }
                points.sort { instantMonitoringStation.manhattenDistance(to: $0) < instantMonitoringStation.manhattenDistance(to: $1) }

                // fire laser
                let vaporizedAstroid = points[0]
                let newPoints = Array(points.dropFirst())
                astroidsGroupedByAngle[angle] = newPoints.count > 0 ? newPoints : nil
                count += 1

                if count == number {
                    return vaporizedAstroid
                }
            }

            print("")
        }
        return nil
    }

    private func getNumOfAstroidsInSight(from root: Point) -> Int {
        var angles = Set<Double>()
        for astroid in astroids.subtracting([root]) {
            angles.insert(root.angle(to: astroid).value)
        }
        return angles.count
    }
}

extension MapAnalyzer {
    struct Point: Hashable, CustomDebugStringConvertible {
        let x: Int
        let y: Int

        var debugDescription: String {
            "(\(x), \(y))"
        }

        func angle(to other: Point) -> Measurement<UnitAngle> {
            let angle = atan2(Double(other.y - y), Double(other.x - x))
            return Measurement(value: angle, unit: UnitAngle.radians)
        }

        func manhattenDistance(to point: Point) -> Int {
            abs(point.x - x) + abs(point.y - y)
        }
    }
}
