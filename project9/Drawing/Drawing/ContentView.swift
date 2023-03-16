//
//  ContentView.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/15.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        // 이것은 SwiftUI가 훨씬 빠른 단일 렌더링 출력으로 화면에 다시 넣기 전에 뷰의 내용을 오프스크린 이미지로 렌더링해야 한다고 알려줌
        // 성능을 위해 매우 좋은 수정자이나, 남발하면 SwiftUI 자체의 성능이 나빠질 수 있음
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
