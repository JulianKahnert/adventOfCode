import Foundation


// MARK: - Part 1

func transform(input: [Int]) -> [Int] {
    var input = input
    var offset = 0

    while true {
        let mutatingOperator: (Int, Int) -> Int
        switch input[offset + 0] {
        case 1:
            mutatingOperator = { lhs, rhs in lhs + rhs }
        case 2:
            mutatingOperator = { lhs, rhs in lhs * rhs }
        case 99:
            return input
        default:
            fatalError()
        }

        let value = mutatingOperator(input[input[offset + 1]], input[input[offset + 2]])
        let saveIndex = input[offset + 3]
        input[saveIndex] = value

        offset += 4
    }
}

func part1() -> Int {
    var sequenceInput = input
    sequenceInput[1] = 12
    sequenceInput[2] = 2

    let output = transform(input: sequenceInput)
    return output[0]
}


// MARK: - Part 2

func part2() -> Int {
    for index1 in 0...99 {
        for index2 in 0...99 {
            var sequenceInput = input
            sequenceInput[1] = index1
            sequenceInput[2] = index2

            if transform(input: sequenceInput)[0] == 19690720 {
                return 100 * index1 + index2
            }
        }
    }

    fatalError()
}
