//
//  parser.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 03.07.2026.
//

import Foundation

// 🧩 ЗАДАЧА 2: Безопасный парсинг строки с числами.
    
enum ParseError: Error {
    case emptyInput
    case invalidToken(String)
}
    
// MARK: - Парсер (Императивный подход через цикл)
func parseNumsStrict(_ string: String, separator: Character = ",") throws -> [Int] {
    let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { throw ParseError.emptyInput }
        
    let components = trimmed.split(separator: separator)
    var result: [Int] = []
        
    for comp in components {
        let token = comp.trimmingCharacters(in: .whitespacesAndNewlines)
        if token.isEmpty { continue }
            
        // Если встретили текст вместо числа, выбрасываем ошибку наружу
        guard let num = Int(token) else { throw ParseError.invalidToken(token) }
        result.append(num)
    }
    return result
}
    
// MARK: - Парсер (Функциональный подход через функциональные методы)
func parseNumsElegant(_ string: String, separator: Character = ",") throws -> [Int] {
    let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { throw ParseError.emptyInput }
        
    return try trimmed
        .split(separator: separator)
        .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        .filter { !$0.isEmpty }
        .map { token in
            guard let num = Int(token) else { throw ParseError.invalidToken(token) }
            return num
        }
}
    
