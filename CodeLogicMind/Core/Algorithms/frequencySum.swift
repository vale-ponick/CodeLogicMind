//
//  frequencySum.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 04.07.2026.
//

import Foundation

// 🧩 Универсальная функция суммы чисел с заданной частотой

/// Суммирует числа, которые встречаются в массиве ровно `frequency` раз.
/// - Parameters:
///   - frequency: количество повторений
///   - array: массив целых чисел
/// - Returns: сумма чисел с указанной частотой
func sumOfNumbers(withFrequency frequency: Int, in array: [Int]) -> Int {
    var counts: [Int: Int] = [:]
    
    for num in array {
        counts[num, default: 0] += 1
    }
    
    return counts
        .filter { $0.value == frequency }
        .map { $0.key }
        .reduce(0, +)
}
