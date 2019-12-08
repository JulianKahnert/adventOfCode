//
//  Intcode.swift
//  
//
//  Created by Julian Kahnert on 05.12.19.
//
// Source: https://github.com/davedelong/AOC

import Foundation
import AOCHelper

struct Intcode {

    private enum Instruction: Int {
        case add = 1
        case multiply = 2
        case `break` = 99
    }

    var memory: [Int]
    var index: Int

    var io: Int {
        get {
            memory[0]
        }
        set {
            memory[0] = newValue
        }
    }

    private var shouldHalt: Bool = false

    init(memory: [Int], index: Int = 0) {
        self.memory = memory
        self.index = index
    }

    mutating func set() {
        let instruction = Instruction(rawValue: memory[index + 0])
        switch instruction {
        case .add:
            memory[memory[index + 3]] = memory[memory[index + 1]] + memory[memory[index + 2]]
        case .multiply:
            memory[memory[index + 3]] = memory[memory[index + 1]] * memory[memory[index + 2]]
        case .break:
            shouldHalt = true
        case .none:
            fatalError("Unable to find instruction '\(instruction)' with value '\(memory[index + 0])' at position '\(index)'.")
        }
    }

    mutating func run() {
        while index < memory.count && !shouldHalt {
            set()
            index += 4
        }
    }
}
