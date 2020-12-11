//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//
// full credit to Dave: https://github.com/davedelong/AOC/blob/master/Sources/AOC2020/Day%207/2020-Day7.swift

import Foundation
import AOCHelper

class Bag: Hashable {
    static func ==(lhs: Bag, rhs: Bag) -> Bool { lhs.name == rhs.name }
    func hash(into hasher: inout Hasher) { hasher.combine(name) }
    
    private var parents = Set<Bag>()
    private var children = Dictionary<Bag, Int>()
    
    var totalCount: Int { children.reduce(into: 0) { $0 += (($1.key.totalCount + 1) * $1.value) } }
    var allParents: Set<Bag> { Set(parents + parents.flatMap(\.allParents)) }
    
    let name: String
    init(name: String) { self.name = name }
    
    func addBag(_ other: Bag, count: Int) {
        other.parents.insert(self)
        children[other, default: 0] += count
    }

}

typealias BagColor = String

func parseBags(_ input: String) -> [BagColor: Bag] {
    input.split(separator: "\n")
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .map { $0.components(separatedBy: " bags contain ") }
        .reduce(into: [BagColor: Bag]()) { (result, components) in
            let outerBagColor = components[0]
            let contents = components[1]
            
            let bag = result[outerBagColor, inserting: Bag(name: outerBagColor)]
            
            if contents != "no other bags." {
                // contents = 1 bright white bag, 2 muted yellow bags.
                contents.trimmingCharacters(in: CharacterSet(arrayLiteral: "."))
                    .split(separator: ",")
                    .map { $0.replacingOccurrences(of: "bags", with: "") }
                    .map { $0.replacingOccurrences(of: "bag", with: "") }
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                    // content = 1 bright white
                    .forEach { content in
                        guard let whitespaceIndex = content.firstIndex(of: " "),
                              let value = Int(content[content.startIndex..<whitespaceIndex].trimmingCharacters(in: .whitespaces)) else { fatalError() }
                        let color = content[whitespaceIndex..<content.endIndex].trimmingCharacters(in: .whitespaces)

                        let contained = result[color, inserting: Bag(name: color)]
                        bag.addBag(contained, count: value)
                    }
            }
        }
}
