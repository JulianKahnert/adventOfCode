//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

struct BoardingPass {
    let data: String

    var row: Int {
        let rowData = data.prefix(7)
        var range = 0...127
        for element in rowData {
            let middle = (range.upperBound - range.lowerBound) / 2 + range.lowerBound
            print(middle)

            if element == "F" {
                // lower half
                range = range.lowerBound...middle
            } else if element == "B" {
                // upper half
                range = (middle + 1)...range.upperBound
            } else {
                preconditionFailure()
            }
        }

        guard range.lowerBound == range.upperBound else { preconditionFailure() }
        return range.lowerBound
    }

    var column: Int {
        let columnData = data.dropFirst(7)

        var range = 0...7
        for element in columnData {
            let middle = (range.upperBound - range.lowerBound) / 2 + range.lowerBound
            print(middle)

            if element == "L" {
                // lower half
                range = range.lowerBound...middle
            } else if element == "R" {
                // upper half
                range = (middle + 1)...range.upperBound
            } else {
                preconditionFailure()
            }
        }

        guard range.lowerBound == range.upperBound else { preconditionFailure() }
        return range.lowerBound
    }

    var seatId: Int {
        row * 8 + column
    }
}
