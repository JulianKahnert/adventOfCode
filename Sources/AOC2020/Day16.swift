//
//  Day16.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//


import Foundation
import AOCHelper

//class: 1-3 or 5-7
//row: 6-11 or 33-44
//seat: 13-40 or 45-50
//
//your ticket:
//7,1,14
//
//nearby tickets:
//7,3,47
//40,4,50
//55,2,20
//38,6,12

struct TicketRule {
    let name: String
    let ranges: [ClosedRange<Int>]
    
    func contains(_ number: Int) -> Bool {
        nil != ranges.first { $0.contains(number) }
    }
}

struct Ticket {
    let fields: [Int]
    
    func isValid(with rules: [TicketRule]) -> Bool {
        !fields.contains { number in
            !rules.contains { $0.contains(number) }
        }
    }
}

//typealias Ticket = [Int]
typealias TicketData = (rules: [TicketRule], yourTicket: Ticket, nearbyTickets: [Ticket])

func parseTicketRules(_ input: String) -> TicketData {
    let elements = input.components(separatedBy: "\n\n")
    let rawRules = elements[0]
    let rawYourTicket = elements[1].components(separatedBy: "your ticket:\n").last!.trimmingCharacters(in: .whitespacesAndNewlines)
    let rawTickets = elements[2].components(separatedBy: "nearby tickets:\n").last!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let ticketRules = rawRules.split(separator: "\n")
        .map(String.init)
        .map { input -> TicketRule in
            let elements = input.split(separator: ":")
            let ranges = elements[1].trimmingCharacters(in: .whitespacesAndNewlines)
                .components(separatedBy: " or ")
                .map { rawRange -> ClosedRange<Int> in
                    let elements = rawRange.split(separator: "-")
                    return Int(elements.first!)!...Int(elements.last!)!
                }

            return TicketRule(name: String(elements[0]), ranges: ranges)
        }
    
    let yourTicket = parseTicket(rawYourTicket)
    let tickets = rawTickets.split(separator: "\n")
        .map { parseTicket(String($0)) }
    return (rules: ticketRules, yourTicket: yourTicket, nearbyTickets: tickets)
}

func getTicketScanningErrorRate(from ticketData: TicketData) -> Int {
    let rules = ticketData.rules
    return ticketData.nearbyTickets
        .compactMap { nearbyTicket in
            let invalidNumber = nearbyTicket.fields.first { number in
                !rules.contains { $0.contains(number) }
            }
            return invalidNumber
        }
        .reduce(0, +)
}

private func parseTicket(_ input: String) -> Ticket {
    let values = input.trimmingCharacters(in: .whitespacesAndNewlines)
        .split(separator: ",")
        .map(String.init)
        .compactMap(Int.init)
    
    return Ticket(fields: values)
}
