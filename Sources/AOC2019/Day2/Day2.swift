import Foundation

// MARK: - Part 1

func part1(_ input: [Int]) -> Int {
    var sequenceInput = input
    sequenceInput[1] = 12
    sequenceInput[2] = 2

    var code = Intcode(memory: sequenceInput)
    code.run()
    return code.memory[0]
}

// MARK: - Part 2

func part2(_ input: [Int]) -> Int {
    for index1 in 0...99 {
        for index2 in 0...99 {
            var sequenceInput = input
            sequenceInput[1] = index1
            sequenceInput[2] = index2

            var code = Intcode(memory: sequenceInput)
            code.run()
            if code.memory[0] == 19690720 {
                return 100 * index1 + index2
            }
        }
    }

    fatalError()
}
