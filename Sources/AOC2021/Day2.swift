//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 02.12.21.
//

import Foundation
import AOCHelper

// typealias DepthCount = (lastDepth: Int, count: Int)
//
// func numOfIncreasedDepth(_ values: [Int], windowSize: Int = 1) -> Int {
//
//    let depthCount: DepthCount = values.indices
//        .reduce(into: (lastDepth: Int.max, count: 0)) { tempDepthCount, index in
//            guard let window = values.window(from: index, size: windowSize) else { return }
//            let currentDepth = window.reduce(0, +)
//            if tempDepthCount.lastDepth < currentDepth {
//                tempDepthCount.count += 1
//            }
//            tempDepthCount.lastDepth = currentDepth
//        }
//
//    return depthCount.count
// }
