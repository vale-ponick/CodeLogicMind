//
//  ContentView.swift - ГЛАВНЫЙ ЭКРАН
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 25.06.2026.
//

import SwiftUI

struct ContentView: View {
    let projects: [Project] = [
        Project(
            name: "ClickCounter",
            icon: "plus.circle",
            view: AnyView(ClickCounterView())
        ),
        Project(
            name: "StepCounterBilboBaggins",
            icon: "figure.walk",
            view: AnyView(StepCounterBilboBagginsView())
            ),
        Project(
            name: "NumberCounter Medium",
            icon: "number.circle.fill",
            view: AnyView(NumberCounterMediumView())
        ),
        Project(
               name: "ClickCounter Hard",
               icon: "number.circle.fill",
               view: AnyView(ClickCounterHardView())
           ),
        Project(
            name: "Algorithms",
            icon: "brain",
            view: AnyView(AlgorithmDemoView())
            )
    ]
    
    var body: some View {
        if projects.isEmpty {
            EmptyStateView(title: "No projects yet", icon: "square.stack.3d.up.slash", description: "Add your first project to get started"
            )
        } else {
            ProjectListView(title: "CodeLogicMind", projects: projects
            ) { project in
                Label(project.name, systemImage: project.icon)
            }
        }
    }
}

  

//#Preview {
 //   ContentView()
//}
