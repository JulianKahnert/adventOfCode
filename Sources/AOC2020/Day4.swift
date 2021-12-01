//
//  Day2.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

func parsePassports(from input: String) -> [NorthPolePassport] {
    let passports = input.components(separatedBy: "\n\n")
        .map { $0.components(separatedBy: CharacterSet.newlines).joined(separator: " ") }
        .map(NorthPolePassport.init)
    return passports
}

struct NorthPolePassport {
    let data: String

    var isValid: Bool {
        FieldTypes.allCases
            .allSatisfy { field in
                data.contains("\(field.rawValue):")
            }
    }

    var hasValidValues: Bool {
        data.split(separator: " ")
            .compactMap { data in
                guard let type = FieldTypes.allCases.first(where: { data.hasPrefix($0.rawValue) }) else {
                    return nil
                }
                return (data, type)
            }
            .allSatisfy { (data: String.SubSequence, type: FieldTypes) in
                let value = data.split(separator: ":")[1]
                return type.isValid(data: String(value))
            }
    }

    init(data: String) {
        self.data = data.components(separatedBy: CharacterSet.newlines).joined(separator: " ")
    }
}

extension NorthPolePassport {

    enum FieldTypes: String, CaseIterable {
        case birthYear = "byr"          // (Birth Year)
        case issueYear = "iyr"          // (Issue Year)
        case expirationYear = "eyr"     // (Expiration Year)
        case height = "hgt"             // (Height)
        case hairColor = "hcl"          // (Hair Color)
        case eyeColor = "ecl"           // (Eye Color)
        case passportId = "pid"         // (Passport ID)
//        case countryId = "cid"        // (Country ID)    // NOT REQUIRED

        func isValid(data: String) -> Bool {
            switch self {
                case .birthYear:
                    guard let year = Int(data) else { return false }
                    return (1920...2002).contains(year)
                case .issueYear:
                    guard let year = Int(data) else { return false }
                    return (2010...2020).contains(year)
                case .expirationYear:
                    guard let year = Int(data) else { return false }
                    return (2020...2030).contains(year)
                case .height:
                    var tmpData = data
                    if tmpData.hasSuffix("in") {
                        tmpData.removeLast(2)
                        guard let value = Int(tmpData) else { return false }
                        return (59...76).contains(value)
                    } else if tmpData.hasSuffix("cm") {
                        tmpData.removeLast(2)
                        guard let value = Int(tmpData) else { return false }
                        return (150...193).contains(value)
                    } else {
                        return false
                    }
                case .hairColor:
                    guard data.hasPrefix("#") else { return false }
                    var tmpData = data
                    tmpData.removeFirst()
                    return tmpData.isHex
                case .eyeColor:
                    return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(data)
                case .passportId:
                    return data.count == 9 && data.isNumeric
            }
        }
    }
}
