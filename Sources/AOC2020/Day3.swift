//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

let tree = "#"

struct TobogganSlope {
    let dx: Int
    let dy: Int
}

func countTrees(in map: [String], with slope: TobogganSlope = TobogganSlope(dx: 3, dy: 1)) -> Int {
    var treeCount = 0
    
    var x = 0
    var y = 0
    for (lineIndex, line) in map.enumerated() {
        guard lineIndex == y else { continue }
        let line = line.trimmingCharacters(in: .whitespaces)
        
        let clampedX = x % line.count
        
        let index = line.index(line.startIndex, offsetBy: clampedX)
        if String(line[index]) == tree {
            treeCount += 1
        }
        x += slope.dx
        y += slope.dy
    }
    return treeCount
}
