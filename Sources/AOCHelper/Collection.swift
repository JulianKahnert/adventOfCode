//
//  Collection.swift
//  
//
//  Created by Julian Kahnert on 05.12.19.
//
// Source: https://github.com/davedelong/AOC

import Foundation

public extension Collection {
    func keyedBy<T: Hashable>(_ keyer: (Element) -> T?) -> Dictionary<T, Element> {
        var d = Dictionary<T, Element>()
        for item in self {
            if let key = keyer(item) {
                d[key] = item
            }
        }
        return d
    }
    
    func combinations<T>(n elements: ArraySlice<T>, k: Int) -> [[T]] {
        if k == 0 {
            return [[]]
        }

        guard let first = elements.first else {
            return []
        }

        let head = [first]
        let subcombinations = combinations(n: elements, k: k - 1)
        var ret = subcombinations.map { head + $0 }
        ret += combinations(n: elements.dropFirst(), k: k)

        return ret
    }

    func combinations<T>(n elements: Array<T>, k: Int) -> [[T]] {
        return combinations(n: ArraySlice(elements), k: k)
    }
}

public extension RandomAccessCollection {

    func at(_ index: Index) -> Element? {
        if index < startIndex || index >= endIndex { return nil }
        return self[index]
    }

}
