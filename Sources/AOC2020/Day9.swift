//
//  Day9.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

func findWrongNumber(in input: [Int], preambleSize: Int) -> Int? {
    var currentIndex = preambleSize
    while let newValue = input.at(currentIndex) {
        let valuePool = input[currentIndex-preambleSize..<currentIndex]

        let newValueFoundInSums = valuePool.combinations(count: 2)
            .map { $0.reduce(0, +) }
            .contains(newValue)

        if !newValueFoundInSums {
            return newValue
        }

        currentIndex += 1
    }
    return nil
}

func findRangeThatSums(to searchValue: Int, in input: [Int]) -> Int? {
    var values = [Int].SubSequence()
    firstIndexLoop: for firstIndex in 0..<input.count {
        secondIndexLoop: for secondIndex in firstIndex+1..<input.count {
            values = input[firstIndex...secondIndex]
            let sum = values.reduce(0, +)

            if sum == searchValue {
                break firstIndexLoop
            } else if sum > searchValue {
                break secondIndexLoop
            }
        }
    }

    guard let minValue = values.min(),
          let maxValue = values.max() else { return nil }

    return minValue + maxValue
}
