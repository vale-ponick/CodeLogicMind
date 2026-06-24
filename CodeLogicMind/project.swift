//
//  project.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 24.06.2026.
//

import Foundation
import SwiftUI

struct Project: Identifiable {
    let id = UUID()
    let name: String // name project
    let icon: String // icon(changing)
    let view: AnyView // view of ? project
}
