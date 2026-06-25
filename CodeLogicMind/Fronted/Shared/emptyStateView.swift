//
//  emptyStateView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 26.06.2026.
//

import SwiftUI

struct EmptyStateView: View {
    let title: String
    let icon: String
    let description: String
    
    var body: some View {
      
            ContentUnavailableView(
                title,
                systemImage: icon,
                description: Text(description)
            )
    }
}
