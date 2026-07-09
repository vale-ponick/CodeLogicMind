//
//  arrayDublicatesEasyToHard.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 09.07.2026.
//

import Foundation

// 'Easy-to-Hard' Array_Duplicates_Evolution.swift

// ТЕМА: Разделение массива на уникальные элементы и дубликаты
// Эволюция подходов: from simple to 'Swift-way'

let input = [1, 1, 1, 3, 3, 3, 5, 5, 7]

// 1️⃣. императивный подход - array + for-in
// Сложность: O(N²) —> Медленно, т.к. .contains перебирает массив КАЖДЫЙ раз.

func imperative(array: [Int]) {
    var searchNums: [Int] = []
    var dublicateNums: [Int] = []
    
    for num in array {
        if !searchNums.contains(num) {
            searchNums.append(num)
        } else if !dublicateNums.contains(num) {
            dublicateNums.append(num)
        }
    }
    print("1️⃣. 'императивный подход' — Уникальные: \(searchNums), Дубликаты: \(dublicateNums)")
}

// 2️⃣. 'Функциональный наивный подход' - array + .reduce
// Сложность: O(N²) — красиво внешне, но под капотом всё тот же медленный перебор.

func functionalNaive(array: [Int]) {
    let result = array.reduce(into: (searchNums: [Int](), dublicateNums: [Int]())) { result, num in
        if !result.searchNums.contains(num) {
            result.searchNums.append(num)
        } else if !result.dublicateNums.contains(num) {
            result.dublicateNums.append(num)
        }
    }
    print("2️⃣. 'Функциональный наивный подход': \(result.searchNums), Дубликаты: \(result.dublicateNums)")
}

// 3️⃣. 'Оптимальный инженерный подход' - Set
// Сложность: O(N) — Быстро! Проверка в Set занимает O(1) + Порядок сохранен.

func optimalSet(array: [Int]) {
    var searchNums: [Int] = []
    var dublicateNums: [Int] = []
    
    var seenNums = Set<Int>()
    var seenDuplicates = Set<Int>()
    
    for num in array {
        // .insert возвращает true, если элемента еще не было в Set
        if seenNums.insert(num).inserted {
            searchNums.append(num)
        } else if seenDuplicates.insert(num).inserted {
            dublicateNums.append(num)
        }
    }
    print("3️⃣. 'Оптимальный инженерный подход': Уникальные: \(searchNums), Дубликаты: \(dublicateNums)")
}

// 4️⃣. 'Аналитический подход' - Dictionary(grouping)
// Сложность: O(N) по скорости, но требует много памяти.
// NB: Порядок элементов ХАОТИЧЕН -> cловари НЕ хранят порядок.

func dictionaryGrouping(array: [Int]) {
    let grouped = Dictionary(grouping: array, by: { $0 })
    
    let searchNums = Array(grouped.keys)
    let dublicateNums = grouped.filter { $0.value.count > 1 }.map { $0.key }
    
    print("4️⃣. 'Аналитический подход': Уникальные: \(searchNums), Дубликаты: \(dublicateNums) (Порядок изменен!)")
}

// 5️⃣. Swift-way функциональный подход - .reduce + Set
// Сложность: O(N) — Быстро, красиво, функционально. Порядок сохранен.
// Громоздкий кортеж вынесен в initialState для читаемости кода.

func swiftWayFunctional(array: [Int]) {
    let initialState = (unique: [Int](), duplicates: [Int](), seen: Set<Int>(), seenDup: Set<Int>())
    
    let result = array.reduce(into: initialState) { res, num in
        if res.seen.insert(num).inserted {
            res.unique.append(num)
        } else if res.seenDup.insert(num).inserted {
            res.duplicates.append(num)
        }
    }
    print("5️⃣. Swift-way функциональный подход: Уникальные: \(result.unique), Дубликаты: \(result.duplicates)")
}

// 6️⃣. Hard-level: universal snippet - Generics Extension
// Код пишется один раз, а затем вызывается одной точкой у любого массива (чисел, строк и т.д.).
// Полная переиспользуемость.

extension Array where Element: Hashable {
    func splitUniqueAndDuplicates() -> (unique: [Element], duplicates: [Element]) {
        let initial = (unique: [Element](), duplicates: [Element](), seen: Set<Element>(), seenDup: Set<Element>())
        
        let result = self.reduce(into: initial) { res, item in
            if res.seen.insert(item).inserted {
                res.unique.append(item)
            } else if res.seenDup.insert(item).inserted {
                res.duplicates.append(item)
            }
        }
        return (result.unique, result.duplicates)
    }
}

// Проверка работы 6️⃣. Hard-level (слайдер на любой тип данных):
let (uniqNums, dupNums) = input.splitUniqueAndDuplicates()
let (uniqWords, dupWords) = ["Swift", "Set", "Swift", "Array"].splitUniqueAndDuplicates()


