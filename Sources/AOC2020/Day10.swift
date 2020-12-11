//
//  Day10.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//


import Foundation
import AOCHelper

func calculateJoltDifferences(from input: [Int]) -> Int {
    var input = input
    var numOfDifferences1 = 0
    var numOfDifferences3 = 0
    
    // first input
    input.append(0)
    
    let sortedInput = input.sorted()
    for (index, element) in sortedInput.enumerated() {
        let upperElement = sortedInput.at(index + 1) ?? element + 3
        let difference = upperElement - element
        //print("\(difference) = \(upperElement) - \(element)")
        
        if difference == 1 {
            numOfDifferences1 += 1
        } else if difference == 3 {
            numOfDifferences3 += 1
        }
    }
    
    return numOfDifferences1 * numOfDifferences3
}


func calculateAllCombinationsOfJoltAdapters(from input: [Int]) -> Int {
    let sortedAdapters = input.sorted()
    
    // source: https://github.com/fredlahde/aoc2020/blob/main/days/day10/part2.py
    var memo = [0:1]
    for adapter in sortedAdapters {
        memo[adapter] = memo[adapter - 1, default: 0] + memo[adapter - 2, default: 0] + memo[adapter - 3, default: 0]
    }
    return memo[sortedAdapters.last!] ?? 0
}
