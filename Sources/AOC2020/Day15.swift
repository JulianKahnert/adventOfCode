//
//  Day15.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

final class SpokenNumberGame {
    let startValues: [Int]
    private var currentTurn: Int
    private var turnValues: [Int]
    private var ageValues = [Int: [Int]]()

    init(with startValues: [Int]) {
        self.startValues = startValues
        self.turnValues = startValues
        self.currentTurn = startValues.count + 1
        for (index, value) in startValues.enumerated() {
            ageValues[value] = [index + 1, index + 1]
        }
    }

    func getSpokenNumber(_ number: Int) -> Int {
        if number >= currentTurn {
            createNumbers(until: number)
        }

        return turnValues[number - 1]
    }

    private func createNumbers(until end: Int) {
        turnValues.reserveCapacity(end)

        var currentIndex = turnValues.count + 1
        while currentIndex <= end {
            let lastValue = turnValues.last!
            let newTurnValues = ageValues[lastValue, default: [0, 0]]// .suffix(2)
            let newValue = newTurnValues.last! - newTurnValues.first!

//            print("Turn \(currentIndex): spoken \(newValue)")
//            ageValues[newValue, default: []].append(currentIndex)

            var tmp = ageValues[newValue, default: []]
            tmp.append(currentIndex)
            ageValues[newValue] = tmp.suffix(2)

            turnValues.append(newValue)
            currentIndex += 1
        }
    }
}
