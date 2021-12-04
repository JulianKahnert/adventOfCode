//
//  Day3.swift
//  
//
//  Created by Julian Kahnert on 03.12.21.
//

import Foundation
import AOCHelper

/// part 1
func calculateSubmarineRates(of rawLines: [String]) -> Int {
    
    let lines = parse(lines: rawLines)
    let summedLine = sumByIndex(lines)

    let gammaRate = calculateRates(summedLine, totalLines: rawLines.count, isGammaRate: true)
    let epsilonRate = calculateRates(summedLine, totalLines: rawLines.count, isGammaRate: false)
    
    return Int(gammaRate, radix: 2)! * Int(epsilonRate, radix: 2)!
}

/// part 2
func calculateLifeSupportRating(of rawLines: [String], isOxyRate: Bool) -> Int {
    let tmpLines = parse(lines: rawLines)
    let lineLength = rawLines[0].count
    
    var lines = tmpLines
    for index in 0..<lineLength {
        let summedLine = sumByIndex(lines)
        let rates = calculateRates(summedLine, totalLines: lines.count, isGammaRate: isOxyRate)
        let strIndex = rates.index(rates.startIndex, offsetBy: index)
        let value = rates[strIndex]

        let tmplines = lines.filter { line in
            let strIndex = line.index(line.startIndex, offsetBy: index)
            return String(line[strIndex]) == String(value)
        }
        
        print("Value \(value) on position: \(index)")
        lines = tmplines
        if tmplines.count < 2 {
            break
        }
    }

    let binaryNum = lines[0].map(String.init).joined()
    print(binaryNum)
    return Int(binaryNum, radix: 2)!
}

private func parse(lines rawLines: [String]) -> [[Int]] {
    return rawLines.map { $0.map { $0.wholeNumberValue! } }
}

private func sumByIndex(_ lines: [[Int]]) -> [Int] {
    let lineLength = lines.first!.count
    let summedLine = lines.reduce(into: Array(repeating: 0, count: lineLength)) { partialResult, line in
        for (index, element) in line.enumerated() {
            partialResult[index] += element
        }
    }
    
    return summedLine
}

private func calculateRates(_ summedLine: [Int], totalLines: Int, isGammaRate: Bool) -> String {
    var result: [Int] = []
    for element in summedLine {
        if isGammaRate {
            result.append(element * 2 >= totalLines ? 1 : 0)
        } else {
            result.append(element * 2 < totalLines ? 1 : 0)
        }
    }
    
    let binaryString = result.map(String.init).joined()
    return binaryString
}


