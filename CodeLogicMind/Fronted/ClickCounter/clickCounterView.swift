//
//  clickCounterView.swift - ЭКРАН СЧЕТЧИКА
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 25.06.2026.
//

import SwiftUI

struct ClickCounterView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(count)")
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(.blue)
            Button("Press") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("ClickCounter")
        .navigationBarTitleDisplayMode(.inline)
    }
}
