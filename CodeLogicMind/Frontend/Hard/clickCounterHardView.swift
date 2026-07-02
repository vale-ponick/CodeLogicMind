//
//  clickCounterHardView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 27.06.2026.
//

import SwiftUI

struct ClickCounterHardView: View {
    @State private var count = 0
    @State private var stepText = "1"
    @State private var step = 1
    @State private var showError = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("\(count)")
                .font(.system(size: 60, weight: .bold))
            
            TextField("Enter step", text: $stepText)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            
            Button("Update step") {
                guard let step = Int(stepText), step > 0 else {
                    showError = true
                    return
                }
                self.step = step
                UserDefaults.standard.set(step, forKey: "step")
            }
            .buttonStyle(.borderedProminent)
            
            Button("+ \(step)") {
                count += step
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .navigationTitle("ClicCounter Hard")
        .alert("Invalid step", isPresented: $showError) {
            Button("Ok") { }
        }
    }
}
