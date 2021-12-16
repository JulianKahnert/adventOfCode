//
//  Day5.swift
//  
//
//  Created by Julian Kahnert on 06.12.21.
//

import Foundation
import AOCHelper

struct Point2: Hashable {
    var x: Int
    var y: Int
}

func findOverlappingPoints(_ lines: [String], includeDiagonals: Bool = false) -> Int {
    let points = parsePoints(lines, includeDiagonals: includeDiagonals)
    
    let pointMap = Dictionary(grouping: points) { point in
        Point2(x: point.x, y: point.y)
    }

//    for column in 0..<10 {
//        for row in 0..<10 {
//            let point = Point2(x: row, y: column)
//            let count = pointMap[point]?.count ?? 0
//            print(count != 0 ? "\(count)" : ".", separator: "", terminator: "")
//        }
//        print("")
//    }
    
    let pointCount = pointMap.reduce(into: 0) { (partialResult, keyValue) in
        guard keyValue.value.count > 1 else { return }
        partialResult += 1
    }
    return pointCount
}

private func parsePoints(_ lines: [String], includeDiagonals: Bool) -> [Point2] {
    var points = [Point2]()
    for line in lines {
        let rawPoints = line.components(separatedBy: " -> ")
        assert(rawPoints.count == 2)
        let rawStart = rawPoints[0].components(separatedBy: ",")
        assert(rawStart.count == 2)
        let start = Point2(x: Int(rawStart[0])!, y: Int(rawStart[1])!)
        
        let rawEnd = rawPoints[1].components(separatedBy: ",")
        assert(rawEnd.count == 2)
        let end = Point2(x: Int(rawEnd[0])!, y: Int(rawEnd[1])!)
        
        if start.x == end.x {
            let yStart = min(start.y, end.y)
            let yEnd = max(start.y, end.y)
            for y in yStart...yEnd {
                points.append(Point2(x: start.x, y: y))
            }
        } else if start.y == end.y {
            let xStart = min(start.x, end.x)
            let xEnd = max(start.x, end.x)
            for x in xStart...xEnd {
                points.append(Point2(x: x, y: start.y))
            }
//        } else if start.x == end.x,
//                  start.y == end.y {
//            continue
        } else {
            guard includeDiagonals,
                  abs((end.x - start.x) / (end.y - start.y)) == 1 else { continue }
            
            for point in zip(stride(from: start.x, to: end.x, by: start.x < end.x ? 1 : -1), stride(from: start.y, to: end.y, by: start.y < end.y ? 1 : -1)) {
                points.append(Point2(x: point.0, y: point.1))
            }
        }
    }
    
    return points
}
