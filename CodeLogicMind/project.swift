//
//  project.swift // модель данных
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 25.06.2026.
//

import SwiftUI

struct Project: Identifiable { // Подписываемся под протокол Identifiable (требует наличия id)
    let id = UUID()           // Уникальный идентификатор — создаётся автоматически при инициализации
    let name: String          // Название проекта (увидит пользователь)
    let icon: String          // Имя системной иконки (SF Symbols)
    let view: AnyView         // Экран проекта (AnyView — стирает тип, чтобы хранить разные экраны в одном массиве)
}
