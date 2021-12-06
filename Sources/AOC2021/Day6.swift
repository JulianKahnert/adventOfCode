//
//  Day6.swift
//  
//
//  Created by Julian Kahnert on 06.12.21.
//

import Foundation
import AOCHelper

typealias LaternFish = Int

func calculateFish(afterDays days: Int, initial initialFish: [Int]) -> Int {
    var currentFish = initialFish.reduce(into: [LaternFish: Int]()) { partialResult, fish in
        partialResult[fish, default: 0] += 1
    }

    for _ in 0..<days {
        var tmp: [LaternFish: Int] = [:]
        
        for (fish, count) in currentFish {
            if fish == 0 {
                tmp[6, default: 0] += count
                tmp[8, default: 0] += count
            } else {
                tmp[fish - 1, default: 0] += count
            }
        }
        currentFish = tmp
    }
    
    return currentFish.map(\.value).reduce(0, +)
}
