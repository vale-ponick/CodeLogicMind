//
//  CodeLogicMindApp.swift  - точка входа
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 25.06.2026.
//

import SwiftUI

@main // Атрибут -> компилятору точку входа в программу, может помечать struct, class, enum.
struct CodeLogicMindApp: App { // Структура, подписанная под протокол App.
    
    init() {
           print(" 🚕💨 Приложение CodeLogicMind запущено!")
       }
    
    var body: some Scene { // Свойство body возвращает сцену.
        // some Scene — непрозрачный тип, SwiftUI сам определяет конкретный тип.
        
        WindowGroup { // Встроенный контейнер окон. Создаёт и отображает главное окно.
            ContentView() // Главный экран — этот интерфейс увидит user при запуске.
        }
    }
}
