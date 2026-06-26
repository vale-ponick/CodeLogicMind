//
//  stepCounterBilboBaggins.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 26.06.2026.
//

import SwiftUI

struct StepCounterBilboBagginsView: View {
    @State private var steps = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Image("hobbit")        // ← имя файла в Assets
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text("\(steps)")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.gray)
            
            HStack(spacing: 40) {
                Button("Go") {
                    steps += 1
                }
                .buttonStyle(.borderedProminent)
                
                Button("Away") {
                    if steps > 0 {
                        steps -= 1
                    }
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }
        }
        .padding()
        .navigationTitle("Bilbo Steps")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        StepCounterBilboBagginsView()
    }
}
