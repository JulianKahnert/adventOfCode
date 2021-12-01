import Foundation
import AOCHelper

enum ShuffleMode: Equatable {
    case newStack
    case cut(Int)
    case dealWithIncrement(Int)

    static func parse(_ raw: String) -> ShuffleMode {
        if raw == "deal into new stack" {
            return .newStack

        } else if raw.starts(with: "cut"),
            let rawNumber = raw.split(separator: " ").last,
            let number = Int(rawNumber) {
            return .cut(number)

        } else if raw.starts(with: "deal with increment"),
            let rawNumber = raw.split(separator: " ").last,
            let number = Int(rawNumber) {
            return .dealWithIncrement(number)

        } else {
            fatalError()
        }
    }
}

extension Array {

    func shuffle(with mode: ShuffleMode) -> [Element] {
        switch mode {
        case .newStack:
            return newStack()
        case .cut(let number):
            return cut(number)
        case .dealWithIncrement(let number):
            return dealWithIncrement(number)
        }
    }

    func newStack() -> [Element] {
        reversed()
    }

    func cut(_ number: Int) -> [Element] {
        let index = number >= 0 ? number : count + number
        return [self.dropFirst(index), self.dropLast(count - index)].flatMap { $0 }
    }

    func dealWithIncrement(_ number: Int) -> [Element] {
        var new = self

        var index = 0
        for element in self {
            new[index] = element
            index = (number + index) % count
        }
        return new
    }
}
