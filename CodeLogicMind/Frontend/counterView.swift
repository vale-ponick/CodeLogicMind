//
//  counterView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 24.06.2026.
//

import SwiftUI

struct CounterView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(count)")
                .font(.system(size: 80, weight: .bold))
            
            Button("Press") {
                count += 1
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        .navigationTitle("ClickCounter")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// #Preview {
//    NavigationStack {
//        CounterView()
//    }
// }
 
