//
//  Day1.swift
//  
//
//  Created by Julian Kahnert on 01.12.20.
//

import Foundation
import AOCHelper

func expenseReportCalculation(_ values: [Int], numOfAddends: Int = 2) -> Int {
    let permutations = values.combinations(count: numOfAddends)
    
    for permutation in permutations {
        guard permutation.reduce(0, +) == 2020 else { continue }
        return permutation.reduce(1, *)
    }
    
    return 0
}
