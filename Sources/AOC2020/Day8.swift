//
//  Day8.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

enum Operation: String {
    case accumulate = "acc"
    case jump = "jmp"
    case noOperation = "nop"
}

struct Instruction: CustomStringConvertible, Equatable, Hashable {
    let operation: Operation
    let argument: Int
    var description: String {
        let sign = argument < 0 ? "-" : "+"
        return "\(operation.rawValue) \(sign)\(abs(argument))"
    }
    
    init(operation: Operation, argument: Int) {
        self.operation = operation
        self.argument = argument
    }
    
    init?(_ input: String) {
        // input = "acc +1"
        let components = input.split(separator: " ")
        guard let first = components.first,
              let second = components.last,
              let operation = Operation(rawValue: String(first)),
              let argument = Int(second) else {
            assertionFailure()
            return nil
        }
        self.operation = operation
        self.argument = argument
    }
}

class HandheldGameConsole {
    typealias OperationArgument = (Operation, Int)
    let instructions: [Instruction]
    
    private(set) var currentIndex = 0
    private(set) var accumulator = 0
    private(set) var looped = false
    
    init(rawInstructions: [String]) {
        self.instructions = rawInstructions.compactMap(Instruction.init)
    }
    
    init(instructions: [Instruction]) {
        self.instructions = instructions
    }
    
    func run() {
        var previousIndices = Set<Int>()
        while let nextInstruction = instructions.at(currentIndex) {
            guard !previousIndices.contains(currentIndex) else {
                self.looped = true
                break
            }
            previousIndices.insert(currentIndex)
            
            handle(nextInstruction.operation, value: nextInstruction.argument)
            print("\(nextInstruction.description)  \t|\t\(accumulator)\t|\t\(currentIndex)")
        }
    }
    
    private func handle(_ instruction: Operation, value: Int) {
        switch instruction {
            case .accumulate:
                accumulator += value
                currentIndex += 1
            case .jump:
                currentIndex += value
            case .noOperation:
                currentIndex += 1
        }
    }
}


func bruteForceInstructionChanges(_ instructions: [Instruction]) -> Int? {
    for index in 0..<instructions.count where instructions[index].operation != .accumulate {
        var instructionsCopy = instructions
        
        let instruction = instructionsCopy[index]
        let newOperation: Operation = instruction.operation == .jump ? .noOperation : .jump
        instructionsCopy[index] = Instruction(operation: newOperation, argument: instruction.argument)
        
        let console = HandheldGameConsole(instructions: instructionsCopy)
        console.run()
        if !console.looped,
           console.currentIndex == instructions.count {
            print(console.currentIndex)
            
            return console.accumulator
        }
    }
    
    return nil
}
