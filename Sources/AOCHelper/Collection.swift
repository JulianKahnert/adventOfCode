//
//  Collection.swift
//  
//
//  Created by Julian Kahnert on 05.12.19.
//
// Source: https://github.com/davedelong/AOC

import Foundation

public extension Collection {
    func print() -> Self {
        for element in self {
            Swift.print(element)
        }
        return self
    }

    func keyedBy<T: Hashable>(_ keyer: (Element) -> T?) -> [T: Element] {
        var d = [T: Element]()
        for item in self {
            if let key = keyer(item) {
                d[key] = item
            }
        }
        return d
    }

    func combinations(count: Int) -> [[Iterator.Element]] {

        if count == 0 {
            return [[]]
        }

        guard let first = first else {
            return []
        }

        let head = [first]
        let subcombos = self.combinations(count: count - 1)
        var ret = subcombos.map { head + $0 }
        ret += dropFirst().combinations(count: count)

        return ret
    }
}

public extension RandomAccessCollection {

    func at(_ index: Index) -> Element? {
        if index < startIndex || index >= endIndex { return nil }
        return self[index]
    }

}

public extension Array {
    func window(from offset: Index, size: Int) -> ArraySlice<Element>? {
        let upperBound = offset + size - 1
        guard upperBound < endIndex else { return nil }
        return self[offset...upperBound]
    }
}
