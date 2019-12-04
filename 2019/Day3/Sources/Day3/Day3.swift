import Foundation

// MARK: - Part 1

struct Instruction {
    enum Direction: String {
        case left = "L"
        case right = "R"
        case up = "U"
        case down = "D"
    }
    let direction: Direction
    let distance: Int

    init(_ sequence: String) {
        let firstChar = sequence.first!
        let rawDistance = sequence.dropFirst()
        self.direction = Direction(rawValue: String(firstChar))!
        self.distance = Int(String(rawDistance))!
    }
}

struct Point: Hashable, Equatable {
    var x: Int
    var y: Int
    var step: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }

    static func == (lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x &&
            lhs.y == rhs.y
    }

    func fly(_ instruction: Instruction) -> [Point] {
        var points = [Point]()
        var currentPoint = Point(x: x, y: y, step: step)
        for _ in 0..<instruction.distance {
            switch instruction.direction {
            case .right:
                currentPoint.x += 1
            case .left:
                currentPoint.x -= 1
            case .up:
                currentPoint.y += 1
            case .down:
                currentPoint.y -= 1
            }
            currentPoint.step += 1

            points.append(currentPoint)
        }

        return points
    }
}

func manhattenDistance(_ lhs: Point, _ rhs: Point) -> Int {
    abs(lhs.x - rhs.x) + abs(lhs.y - rhs.y)
}

func buildSequence(_ instructions: [Instruction]) -> [Point] {
    var currentPosition = Point(x: 0, y: 0, step: 0)
    return instructions.map { instruction -> [Point] in
        let positions = currentPosition.fly(instruction)
        currentPosition = positions.last!
        return positions
    }
    .flatMap { $0 }
}

func findIntersections(of seq1: [Instruction], and seq2: [Instruction]) -> [Point] {
    let seq1Points = Set(buildSequence(seq1))
    let seq2Points = Set(buildSequence(seq2))
    return Array(seq1Points.intersection(seq2Points))
}

func getMinDistance(of seq1: [String], and seq2: [String]) -> Int {
    let wire1 = seq1.map { Instruction($0) }
    let wire2 = seq2.map { Instruction($0) }
    return findIntersections(of: wire1, and: wire2)
        .map { manhattenDistance($0, Point(x: 0, y: 0, step: 0)) }
        .min()!
}

func part1() -> Int {
    let dist = getMinDistance(of: wire1, and: wire2)
    return dist
}


// MARK: - Part 2

func getMinSteps(of seq1: [String], and seq2: [String]) -> Int {
    let wire1 = buildSequence(seq1.map { Instruction($0) })
    let wire2 = buildSequence(seq2.map { Instruction($0) })
    let intersections = Set(wire1).intersection(Set(wire2))

    return intersections.map { intersection in
        let point1 = wire1.first { $0 == intersection }
        let point2 = wire2.first { $0 == intersection }
        return point1!.step + point2!.step
    }
    .min()!
}

func part2() -> Int {
    let steps = getMinSteps(of: wire1, and: wire2)
    return steps
}
