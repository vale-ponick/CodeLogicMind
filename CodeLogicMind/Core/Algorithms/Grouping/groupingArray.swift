//
//  groupingArray.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 05.07.2026.
//

import Foundation

// MARK: - ШПАРГАЛКА: Группировка, Расчет и Фильтрация данных (Junior+)

// ВАРИАНТ 1: ПОШАГОВЫЙ (С изолированной областью видимости)
// ---
func runStepByStepVariant() {
    let rawData = [
        "ItemA: 10",
        "СломаннаяСтрокаБезДвоеточия",
        "ItemB: 20",
        "ItemA: ОшибкаВместоЧисла",
        "ItemA: 30"
    ]

    // 1️⃣ ЭТАП: Группировка массива строк в словарь массивов [String: [Int]]
    let groupedData = rawData.reduce(into: [String: [Int]]()) { resultDict, rawString in
        let parts = rawString.split(separator: ": ")
        
        guard parts.count == 2, let value = Int(parts[1]) else {
            print("⚠️ Ошибка: Неверный формат данных в строке -> \"\(rawString)\"")
            return
        }
        
        let key = String(parts[0])
        resultDict[key, default: []].append(value)
    }

    // 2️⃣ ЭТАП: Преобразование значений словаря (расчет среднего)
    let calculatedData = groupedData.mapValues { values -> Double in
        let sum = values.reduce(0, +)
        return Double(sum) / Double(values.count)
    }

    // 3️⃣ ЭТАП: Фильтрация словаря по условию
    let filteredData = calculatedData.filter { (key, calculatedValue) in
        return calculatedValue >= 15.0
    }
    
    print("Результат Варианта 1: \(filteredData)")
}

// ВАРИАНТ 2: ЦЕПОЧКА МЕТОДОВ (В отдельной функции)
// ---
func runMethodChainingVariant() {
    let rawData = [
        "ItemA: 10",
        "СломаннаяСтрокаБезДвоеточия",
        "ItemB: 20",
        "ItemA: ОшибкаВместоЧисла",
        "ItemA: 30"
    ]

    let elegantResult = rawData
        .reduce(into: [String: [Int]]()) { resultDict, rawString in
            let parts = rawString.split(separator: ": ")
            
            guard parts.count == 2, let value = Int(parts[1]) else {
                print("⚠️ [Цепочка] Пропущена некорректная строка: \"\(rawString)\"")
                return
            }
            
            let key = String(parts[0])
            resultDict[key, default: []].append(value)
        }
        .mapValues { values -> Double in
            Double(values.reduce(0, +)) / Double(values.count)
        }
        .filter { key, average in
            average >= 15.0
        }
    
    print("Результат Варианта 2: \(elegantResult)")
}
