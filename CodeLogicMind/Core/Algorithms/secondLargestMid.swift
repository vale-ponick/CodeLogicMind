//
//  secondLargestMid.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 02.07.2026.
//

import Foundation

// ---
// 🧩 ЗАДАЧА: Найти второе по величине уникальное число в массиве.
// ---

// MARK: - Подход "Easy" (Через Set и сортировку)
// Время: O(N log N) из-за сортировки | Память: O(N) для создания Set

func secondLargestEasy(_ array: [Int]) -> Int? {
    return Set(array).sorted(by: >).dropFirst().first
}

// MARK: - Подход "Mid" (Оптимальный, в один проход)
// Время: O(N) — массив сканируется один раз | Память: O(1) — не копирует массив

func secondLargestMid(_ array: [Int]) -> Int? {
    var largest: Int? = nil
    var second: Int? = nil
    
    for num in array {
        if num == largest { continue }                // 🚫 Игнорируем двойников
        if num > (largest ?? Int.min) {              // 📈 Новый рекорд?
            second = largest                         // Старый рекорд → 2 место
            largest = num                            // 🥇 Новый 1 место
        } else if num > (second ?? Int.min) {        // 📈 Между 1 и 2?
            second = num                             // 🥈 Новое 2 место
        }
    }
    return second
}

