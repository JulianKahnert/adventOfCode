//
//  Collection.swift
//  
//
//  Created by Julian Kahnert on 05.12.19.
//
// Source: https://github.com/davedelong/AOC

import Foundation

public extension Dictionary {
    subscript(key: Key, inserting value: @autoclosure () -> Value) -> Value {
        mutating get {
            if let e = self[key] { return e }
            let newValue = value()
            self[key] = newValue
            return newValue
        }
    }
}
