//
//  Day4.swift
//  
//
//  Created by Julian Kahnert on 04.12.21.
//

import Foundation
import AOCHelper
import AppKit

func playBingo(with input: String) -> Int {
    let game = BingoGame.parse(input)
    while(game.playRound()) {
        if let board = game.findBoardWithBingo() {
            return board.sumUnmarked() * game.rounds[game.roundNumber - 1]
        }
    }
    fatalError("No bingo board found!")
}

func playBingoToLoose(with input: String) -> Int {
    let game = BingoGame.parse(input)

    var alreadyWon: Set<Int> = []
    while(game.playRound()) {
        let results = game.boards.enumerated().filter { $0.1.hasBingo() && !alreadyWon.contains($0.0) }
        for result in results {
            alreadyWon.insert(result.offset)
        }

        if alreadyWon.count == game.boards.count || game.roundNumber == game.rounds.count - 1  {
            return results.last!.element.sumUnmarked() * game.rounds[game.roundNumber - 1]
        }
    }
    
    fatalError("No bingo board found!")
}

class BingoGame: CustomStringConvertible {
    var roundNumber = 0
    let rounds: [Int]
    let boards: [Board]
    
    var description: String {
        """
        \(rounds.map(String.init).joined(separator: " "))
        
        \(boards)
        """
    }
    
    static func parse(_ input: String) -> BingoGame {
        var parts = input
            .components(separatedBy: "\n\n")
        let rounds = parts.removeFirst()
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .components(separatedBy: ",")
            .map { Int($0)! }
            
        
        let boards = parts.map { part -> Board in
            let fields = part.trimmingCharacters(in: .whitespacesAndNewlines)
                .components(separatedBy: .newlines)
                .map { rawBoard -> [Int] in
                    rawBoard
                        .components(separatedBy: " ")
                        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                        .filter { !$0.isEmpty }
                        .map { Int($0)! }
                }
            return Board(fields: fields)
        }

        return BingoGame(rounds: rounds, boards: boards)
    }
    
    init(rounds: [Int], boards: [Board]) {
        self.rounds = rounds
        self.boards = boards
    }
    
    func playRound() -> Bool {
        let selectedNumber = rounds[roundNumber]
        for board in boards {
            board.mark(field: selectedNumber)
        }
        roundNumber += 1
        
        return roundNumber < rounds.count
    }
    
    func findBoardWithBingo() -> Board? {
        boards.first { $0.hasBingo() }
    }
}

extension BingoGame {
    class Board: CustomStringConvertible {
        var description: String {
            fields
                .map { $0.map(String.init).joined(separator: " ") }
                .joined(separator: "\n")
                .appending("\n\n")
        }
        
        let id = UUID()
        let fields: [[Int]]
        private var markedFields: [[Bool]]
        
        init(fields: [[Int]]) {
            self.fields = fields
            self.markedFields =  Array(repeating: Array(repeating: false, count: fields.count), count: fields[0].count)
        }
        
        func mark(field: Int) {
            for (rowIndex, row) in fields.enumerated() {
                for (columnIndex, column) in row.enumerated() {
                    if column == field {
                        markedFields[rowIndex][columnIndex] = true
                    }
                }
            }
        }
        
        func sumUnmarked() -> Int {
            var sum = 0
            for (rowIndex, row) in fields.enumerated() {
                for (columnIndex, column) in row.enumerated() where !markedFields[rowIndex][columnIndex] {
                    sum += column
                }
            }
            return sum
        }
        
        func hasBingo() -> Bool {
            // 5 in a row
            let found5InARow = (markedFields.first { row in
                row.allSatisfy({ $0 })
            } != nil)
            
            // 5 in a column
            var found5InAColumn = false
            for rowIndex in 0..<markedFields.count {
                let columnSum = markedFields.reduce(into: 0) { partialResult, row in
                    partialResult += row[rowIndex] ? 1 : 0
                }
                found5InAColumn = found5InAColumn || columnSum == 5
                if found5InAColumn {
                    break
                }
            }
            
            return found5InARow || found5InAColumn
        }
    }
}
