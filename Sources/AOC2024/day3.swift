import Foundation

func day3Part1(_ input: String) -> Int {
    let pattern = #"mul\(\d{1,3},\d{1,3}\)"#

    let regex = try! NSRegularExpression(pattern: pattern)
    let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
        .compactMap { match in
            if let range = Range(match.range, in: input) {
                return String(input[range])
            }

            return nil
        }
    
    let instructions = matches
        .map { $0.dropFirst(4).dropLast().split(separator: ",") }
        .map { (first: Int($0[0])!, second: Int($0[1])!) }

    return instructions.reduce(into: 0) { partialResult, instruction in
        let (first, second) = instruction
        partialResult += first * second
    }
}

func day3Part2(_ input: String) -> Int {
    let pattern = #"(don\'t\(\))|(do\(\))|(mul\(\d{1,3},\d{1,3}\))"#

    let regex = try! NSRegularExpression(pattern: pattern)
    let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
        .compactMap { match in
            if let range = Range(match.range, in: input) {
                return String(input[range])
            }

            return nil
        }
   
    var index = 0
    var validMatches: [String] = []
    var shouldAdd = true
    while index < matches.count {
        let match = matches[index]
        
        if match == "do()" {
            shouldAdd = true
        } else if match == "don't()" {
            shouldAdd = false
        }
        
        if shouldAdd && match.starts(with: "mul") {
            validMatches.append(match)
        }
        index += 1
    }
    let instructions = validMatches
        .map { $0.dropFirst(4).dropLast().split(separator: ",") }
        .map { (first: Int($0[0])!, second: Int($0[1])!) }

    return instructions.reduce(into: 0) { partialResult, instruction in
        let (first, second) = instruction
        partialResult += first * second
    }
}
