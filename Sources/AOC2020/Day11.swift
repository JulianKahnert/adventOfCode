//
//  Day11.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

enum SeatType: String {
    case empty = "L"
    case occupied = "#"
    case floor = "."
}

final class FloorPlan {
    static let directions: [(Int, Int)] = [
        (-1, -1),
        (-1, 0),
        (-1, 1),
        (0, -1),
//        (0, 0),
        (0, 1),
        (1, -1),
        (1, 0),
        (1, 1)
    ]

    private(set) var map: [[SeatType]]

    init(_ input: String) {
        self.map = Self.parse(input)
    }

    func getOccupiedSeatCountWhenStable(rule2: Bool = false) -> Int {
        var hasChanged = true
        while hasChanged {
            if rule2 {
                hasChanged = applyRules2()
            } else {
                hasChanged = applyRules()
            }
        }
        return map.flatMap { $0 }
            .filter { $0 == .occupied }
            .count
    }

    func applyRules() -> Bool {
        var hasChanged = false
        var newMap = self.map
        for rowIndex in 0..<map.count {
            for colIndex in 0..<map[rowIndex].count {
                let seat = map[rowIndex][colIndex]
                if seat == .empty,
                   numOfOccupiedNeighbors(row: rowIndex, col: colIndex) == 0 {
                    newMap[rowIndex][colIndex] = .occupied
                    hasChanged = true
                } else if seat == .occupied,
                          numOfOccupiedNeighbors(row: rowIndex, col: colIndex) >= 4 {
                    newMap[rowIndex][colIndex] = .empty
                    hasChanged = true
                } else {
                    // no change
                }
//                print(newMap[rowIndex][colIndex].rawValue, separator: "", terminator: "")
            }
//            print("\n", separator: "", terminator: "")
        }

        self.map = newMap
        return hasChanged
    }

    func applyRules2() -> Bool {
        var hasChanged = false
        var newMap = self.map
        for rowIndex in 0..<map.count {
            for colIndex in 0..<map[rowIndex].count {
                let seat = map[rowIndex][colIndex]
                if seat == .empty,
                   numOfOccupiedNeighborsInSight(row: rowIndex, col: colIndex) == 0 {
                    newMap[rowIndex][colIndex] = .occupied
                    hasChanged = true
                } else if seat == .occupied,
                          numOfOccupiedNeighborsInSight(row: rowIndex, col: colIndex) >= 5 {
                    newMap[rowIndex][colIndex] = .empty
                    hasChanged = true
                } else {
                    // no change
                }
//                print(newMap[rowIndex][colIndex].rawValue, separator: "", terminator: "")
            }
//            print("\n", separator: "", terminator: "")
        }

        self.map = newMap
        return hasChanged
    }

    private func numOfOccupiedNeighbors(row: Int, col: Int) -> Int {
        var count = 0
        for direction in Self.directions {
            if let row = map.at(row + direction.0),
               row.at(col + direction.1) == .occupied {
                count += 1
            }
        }
        return count
    }

    func numOfOccupiedNeighborsInSight(row: Int, col: Int) -> Int {
        var count = 0
        for direction in Self.directions {
            outterloop: for rowMultiplier in 1..<map.count {
                let rowOffset = direction.0 * rowMultiplier
//                for colMultiplier in 2..<map.first!.count {
//                    let colOffset = direction.1 * colMultiplier
                let colOffset = direction.1 * rowMultiplier

                    if let rowItems = map.at(row + rowOffset),
                       let seat = rowItems.at(col + colOffset),
                       seat != .floor {
//                        print("(\(row + rowOffset)|\(col + colOffset))")
                        if seat == .occupied {
                            count += 1
                        }
                        break outterloop
                    }
//                }
            }
        }
        return count
    }

    private static func parse(_ input: String) -> [[SeatType]] {
        input.split(separator: "\n")
            .map(String.init)
            .map { input -> [SeatType] in
                return input.map(String.init)
                    .compactMap(SeatType.init)
            }
    }
}
