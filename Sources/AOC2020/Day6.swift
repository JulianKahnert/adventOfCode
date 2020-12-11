//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

extension String {
    func formGroupCountDay6() -> Int {
        self
        .components(separatedBy: "\n\n")
        .map { $0.replacingOccurrences(of: "\n", with: "") }
        .map { $0.replacingOccurrences(of: " ", with: "") }
        .map(Set.init)
        .map(\.count)
        .reduce(0, +)
    }
    
    func formEveryoneCountDay6() -> Int {
//        var count = 0
//        let groups = self.components(separatedBy: "\n\n")
//        for group in groups {
//            let persons = group.components(separatedBy: "\n")
//            var matchedAll = Set(group.replacingOccurrences(of: "\n", with: ""))
//            for person in persons {
//                matchedAll.formIntersection(Set(person))
//            }
//            count += matchedAll.count
//        }
//        return count

        self.components(separatedBy: "\n\n")
            .map { $0.components(separatedBy: "\n") }
            .compactMap { $0.uniqueElements() }
            .map(\.count)
            .reduce(0, +)
    }
}


fileprivate extension Collection where Element: Sequence, Element.Element: Hashable {
    func uniqueElements() -> Set<Element.Element> {
        var iterator = makeIterator()
        guard let first = iterator.next() else { return Set() }
        
        var matchedAll = Set(first)
        while let next = iterator.next() {
            matchedAll.formIntersection(Set(next))
        }
        return matchedAll
    }
}
