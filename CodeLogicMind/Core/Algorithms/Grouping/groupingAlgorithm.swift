//
//  groupingAlgorithm.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 05.07.2026.
//

import Foundation

func sumOfUniqueOnce(_ nums: [Int]) -> Int {
    var counts: [Int: Int] = [:] // для хранения в памяти
    for num in nums {
        counts[num, default: 0] += 1 // перебрали все числа в массиве и счетчик увеличивается
    }
        
        return counts
            .filter { $0.value == 1 }
            .map { $0.key }
            .reduce(0, +)
}
