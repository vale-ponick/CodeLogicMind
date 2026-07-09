//
//  findSingleNumber.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 09.07.2026.
//

import Foundation

// ТЕМА: Поиск единственного числа без пары в массиве дубликатов
// Алгоритм: XOR (Исключающее ИЛИ) — Магия побитовых операций

let discoInput = [1, 2, 4, 1, 2, 7, 7]

// 1️⃣. Императивный подход через цикл for-in
// Сложность по скорости: O(N) — один проход по массиву.
// Сложность по памяти: O(1) — не создаем новые массивы или Set.

func findSingleImperative(array: [Int]) {
    var wallflower = 0 // Стартовая точка (пустой танцпол)
    
    for person in array {
        wallflower = wallflower ^ person // Применяем XOR (магию дискотеки)
    }
    
    print("1️⃣. На дискотеке без пары остался элемент: \(wallflower)")
}

// 2️⃣. Swift-way элегантный однострочник через .reduce
// Вместо длинного замыкания передаем оператор `^` как готовую функцию.

func findSingleSwiftWay(array: [Int]) {
    let wallflower = array.reduce(0, ^)
    print("2️⃣. Swift-way ответ: \(wallflower)")
}

// Проверка работы:
// findSingleImperative(array: discoInput) // Выведет: 4
// findSingleSwiftWay(array: discoInput)   // Выведет: 4
