//
//  ProjectListView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 26.06.2026.
//

import SwiftUI

// Snippet: список проектов с навигацией
// используй как ШАБЛОН для ЛЮБОГО списка

struct ProjectListView<Content: View>: View { // Дженерик `<Content: View>` —> содержимое ячейки м.б. любым View.
    let title: String // заголовок, который появится в навбаре.
    let projects: [Project] // ← исправлено: projects (множественное число)
    let content: (Project) -> Content
    
    //  ТЕЛО ЭКРАНА — то, что увидит user
    
    var body: some View {
        NavigationStack { // переходи между экранами и покажи заголовок
            List(projects) { project in // ← исправлено: projects
                NavigationLink(destination: project.view) { // `NavigationLink` — делает строку кликабельной.
                    // При нажатии открывается экран `project.view`
                    content(project)
                }
            }
            .navigationTitle(title) // Устанавливаем заголовок навбара.
        }
    }
}
//  📌 ПРИМЕР ИСПОЛЬЗОВАНИЯ:

// ProjectListView(
//     title: "CodeLogicMind",
//     projects: projects
// ) { project in
//     Label(project.name, systemImage: project.icon)
// }
