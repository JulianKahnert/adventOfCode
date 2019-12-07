import Foundation

// MARK: - Part 1

func day5Part1(_ input: [Int]) -> Int {
    let intcode = Intcode(memory: input, supportedOperations: [.add, .multiply, .set, .get, .break])
    intcode.run(input: 1)
    return intcode.io
}


// MARK: - Part 2

func day5Part2(_ input: [Int]) -> Int {
    let intcode = Intcode(memory: input, supportedOperations: [.add, .multiply, .set, .get, .jumpIfTrue, .jumpIfFalse, .lessThan, .equal, .break])
    intcode.run(input: 5)
    return intcode.io
}

