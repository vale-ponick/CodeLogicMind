//
//  ContentView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 24.06.2026.
//

import SwiftUI

struct ContentView: View {
    let projects: [Project] = [ // adding current projects
        Project(name: "ClickCounter", icon: "plus.circle", view: AnyView(CounterView()))
        ]
    
    var body: some View {
        NavigationStack {
            List(projects) { project in
                NavigationLink(destination: project.view) {
                    Label(project.name, systemImage: project.icon)
                }
            }
                .navigationTitle("CodeLogicMind")
                .overlay {
                    if projects.isEmpty {
                        ContentUnavailableView(
                            "Add first project",
                            systemImage: "square.stack.3d.up.slash",
                            description: Text("Create project to founder Fronted or Backend")
                    )
                }
            }
        }
    }
}
// ❌ ПРЕВЬЮ закомментирован! Комп не гудит!
// #Preview {
//    ContentView()
