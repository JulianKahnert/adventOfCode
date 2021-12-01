//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

struct PasswordPolicy {
    let range: ClosedRange<Int>
    let character: String

    func validate(_ input: String) -> Bool {
        let count = input.count(character: character)
        return range.contains(count)
    }
}

func validPasswordCalculation(_ values: [String]) -> Int {
    values.filter { value in
        let elements = value.split(separator: ":")
        let policyElements = elements[0].split(separator: " ")
        let policyRange = policyElements[0].split(separator: "-")

        let range = Int(policyRange[0])!...Int(policyRange[1])!

        let policy = PasswordPolicy(range: range, character: String(policyElements[1]))
        return policy.validate(String(elements[1]))
    }
    .count
}

func validPasswordCalculation2(_ values: [String]) -> Int {
    values.filter { value in
        let elements = value.split(separator: ":")
        let policyElements = elements[0].split(separator: " ")
        let policyRange = policyElements[0].split(separator: "-")
        let range = Int(policyRange[0])!...Int(policyRange[1])!

        let validationString = elements[1].trimmingCharacters(in: .whitespaces)

        let firstIndex = validationString.index(validationString.startIndex, offsetBy: range.lowerBound - 1)
        let firstElement = String(validationString[firstIndex])
        let secondIndex = validationString.index(validationString.startIndex, offsetBy: range.upperBound - 1)
        let secondElement = String(validationString[secondIndex])

        return (firstElement == policyElements[1]) != (secondElement == policyElements[1])
    }
    .count
}
