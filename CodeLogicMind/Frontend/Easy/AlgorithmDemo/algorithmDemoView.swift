//
//  algorithmDemoView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 02.07.2026.
//

import SwiftUI

struct AlgorithmDemoView: View {
    
    @State private var result: Int? = nil
    @State private var inputArray: String = "12, 21, 3, 7, 0, -2, 33, 12, 21"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Second largest number")
                .font(.title2)
            
            TextField("Enter number separated by commas", text: $inputArray)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .onChange(of: inputArray) { _, _ in
                    result = nil
                }
            
            Button("Find second largest") {
                let array = parseInput(inputArray)
                result = secondLargestMid(array)
            }
            .buttonStyle(.borderedProminent)
            
            if let result = result {
                Text("Second laegest: \(result)")
                    .font(.title2)
                    .foregroundColor(.green)
            } else {
                Text("Enter numbers")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .navigationTitle("Algorithm Demo")
        .onAppear {
                   let nums = [3, 7, 2, 9, 4, 9, 6]
                   print("nthLargest(1):", nthLargest(1, in: nums) ?? "nil")
                   print("nthLargest(2):", nthLargest(2, in: nums) ?? "nil")
                   print("nthLargest(3):", nthLargest(3, in: nums) ?? "nil")
                   print("nthLargest(7):", nthLargest(7, in: nums) ?? "nil")
               }
    }
    func parseInput(_ string: String) -> [Int] {
        string
            .split(separator: ",")
            .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
    }
}
