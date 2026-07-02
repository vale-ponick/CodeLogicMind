//
//  numberCounterMediumView.swift
//  CodeLogicMind
//
//  Created by Валерия Пономарева on 26.06.2026.
//

import SwiftUI



struct NumberCounterMediumView: View {
    @State private var count = 0
    
    var fontSize: CGFloat {
        switch count {
        case 0: return 50
        case 1...5: return 65
        case 6...10: return 80
        default: return 100
        }
    }
    
    var textColor: Color {
            switch count {
            case 0: return .gray
            case 1...5: return .blue
            case 6...10: return .green
            default: return .orange
            }
        }
    
    var body: some View {
        VStack(spacing: 30) {
               Image("hobbit")        // ← имя файла в Assets
                   .resizable()
                   .scaledToFit()
                   .frame(width: 100, height: 100)
                   .clipShape(Circle())  // ← можно сделать круглой
               
               Text("\(count)")
                   .font(.system(size: fontSize, weight: .bold))
                   .foregroundColor(textColor)
                   .animation(.spring(), value: count)
            
            HStack {
                Button("+ 1") {
                    count += 1
                    print("count = \(count)")
                    }

                Button("- 1") {
                    if count > 0 {
                        count -= 1
                    }
                }
                .buttonStyle(.bordered)
                .tint(.red)
                
                Button("Away") {
                    count = 0
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("Number Counter")
        .navigationBarTitleDisplayMode(.inline)
    }
}

