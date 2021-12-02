//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 02.12.21.
//

import Foundation
import AOCHelper

struct SteeringCommand {
    let direction: Direction
    let value: Int
}

enum Direction: String {
    case forward, down, up
}

func calculateSubmarineRoute(from inputs: [String], isPart1: Bool = true) -> Point3 {
    var position: Point3 = .zero
    for input in inputs {
        let command = parseSubmarineInput(input)
        
        if isPart1 {
            position = position.apply(command)
        } else {
            position = position.applyPart2(command)
        }
    }
    return position
}

private func parseSubmarineInput(_ input: String) -> SteeringCommand {
    let rawInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        .components(separatedBy: " ")
    
    assert(rawInput.count == 2)
    
    guard let direction = Direction(rawValue: rawInput[0]),
          let value = Int(rawInput[1]) else { fatalError("Failed to parse command input \(input)") }
    
    return SteeringCommand(direction: direction, value: value)
}

extension Point3 {
    fileprivate func apply(_ command: SteeringCommand) -> Point3 {
        switch command.direction {
        case .forward:
            return Point3(x: self.x, y: self.y, z: self.z + command.value)
        case .down:
            return Point3(x: self.x, y: self.y - command.value, z: self.z)
        case .up:
            return Point3(x: self.x, y: self.y + command.value, z: self.z)
        }
    }
    
    fileprivate func applyPart2(_ command: SteeringCommand) -> Point3 {
        switch command.direction {
        case .forward:
            return Point3(x: self.x, y: self.y - (self.x * command.value), z: self.z + command.value)
        case .down:
            return Point3(x: self.x + command.value, y: self.y, z: self.z)
        case .up:
            return Point3(x: self.x - command.value, y: self.y, z: self.z)
        }
    }
    
    var depth: Int {
        -1 * y
    }
    var horizontal: Int {
        z
    }
    var aim: Int {
        x
    }
}
