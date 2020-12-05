//
//  File.swift
//  
//
//  Created by Julian Kahnert on 08.12.19.
//

import Foundation

public extension String {

    func count<T: StringProtocol>(character: T) -> Int {
        let tok =  components(separatedBy: character)
        return tok.count - 1
    }

    func splitInHalf() -> (first: String, second: String) {

        let halfLength = count / 2
        let parts = split(by: halfLength)

        return (parts[0], parts[1])
    }

    func split(by length: Int) -> [String] {
        var parts = [String]()

        var currentIndex: Index? = startIndex
        while currentIndex != nil && currentIndex! < endIndex {

            let currentEndIndex: Index
            if let newEndIndex = index(currentIndex!, offsetBy: length, limitedBy: endIndex) {
                currentEndIndex = newEndIndex
            } else {
                currentEndIndex = endIndex
            }

            let currentSubstring = String(self[currentIndex!..<currentEndIndex])
            parts.append(currentSubstring)

            currentIndex = currentEndIndex
        }

        return parts
    }
    
    var isNumeric: Bool {
        CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
    }
    
    var isHex: Bool {
        CharacterSet(charactersIn: "0123456789abcdef").isSuperset(of: CharacterSet(charactersIn: self))
    }
}
