//
//  secondLargest.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 02.07.2026.
//

import Foundation

// 🧩 ЗАДАЧА: Найти второе по величине уникальное число в массиве.

//алгоритм - краткий через Set + сортировка (O(n log n))
let nums = [3, 7, 2, 9, 4, 9, 6]
func secondLargest(in array: [Int]) -> Int? {
  
    let uniqueSorted  = Set( array).sorted(by: >)
    
    return uniqueSorted.count > 1 ? uniqueSorted[1] : nil
}

// алгоритм — классический подход «один проход с двумя максимумами» (O(n))
func secondLargestNum(in array: [Int]) -> Int? {
    let unique = Set(array)
    guard unique.count >= 2 else { return nil } // проверка безопасности
    
    var largest = Int.min // присвоили min значение
    var secondLargest = Int.min // присвоили min значение
    
    for num in unique {
        if num > largest { // если число в массиве больше первого
            secondLargest = largest // то второму числу присвоим значение первого
            largest = num // первое число и есть искомое
        } else if num > secondLargest && num != largest { // но если число больше второго + не первое
           secondLargest = num // то искомое число - второе
        }
    }
    return secondLargest
}

