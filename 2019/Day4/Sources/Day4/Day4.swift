import Foundation

// MARK: - Part 1

extension String {
    func sameDigits() -> Bool {
        var mostRecent = self.first!
        for digit in self.dropFirst() {
            if mostRecent == digit {
                return true
            }
            mostRecent = digit
        }
        return false
    }

    func neverDecreses() -> Bool {
        var mostRecent = self.first!
        for digit in self.dropFirst() {
            if mostRecent > digit {
                return false
            }
            mostRecent = digit
        }
        return true
    }
}

func countValidNumber(in range: ClosedRange<Int>) -> Int {
    var count = 0
    for number in range {
        let numberStr = String(number)
        guard numberStr.sameDigits(),
            numberStr.neverDecreses() else { continue }
        count += 1
    }
    return count
}

func part1() -> Int {
    let validNumbers = countValidNumber(in: input)
    return validNumbers
}


// MARK: - Part 2

extension String {
    func sameDoubleDigits() -> Bool {
        let array = Array(self)
        for c in array {
            let firstOccurrence = array.firstIndex(of: c)!
            let lastOccurrence = array.lastIndex(of: c)!

            if lastOccurrence == firstOccurrence + 1 {
                return true
            }
        }

        return false
    }
}

func part2() -> Int {
    let validNumbers = input
        .map { String($0) }
        .filter { $0.sameDoubleDigits() }
        .filter { $0.neverDecreses() }
        .count
    return validNumbers
}

