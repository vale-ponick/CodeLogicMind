//
//  sumOfOddFrequence.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 05.07.2026.
//

import Foundation

func countOddRrequence(_ nums: [Int]) -> Int {
    var counts: [Int: Int] = [:]
    
    for num in nums {
        counts[num, default: 0] += 1
    }
    return counts
        .filter { $0.value % 2 != 0 }
        .map { $0.key }
        .reduce(0, +)
}

