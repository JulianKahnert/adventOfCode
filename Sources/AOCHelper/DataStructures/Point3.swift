//
//  File.swift
//  
//
//  Created by Julian Kahnert on 13.12.19.
//

import Foundation

public struct Point3: Hashable, Equatable, CustomDebugStringConvertible, Sendable {

    nonisolated public static let zero = Point3(x: 0, y: 0, z: 0)

    public var x: Int
    public var y: Int
    public var z: Int

    public var debugDescription: String {
        "(\(x), \(y), \(z))"
    }

    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}
