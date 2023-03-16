//
//  ContentView.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/15.
//

import SwiftUI

struct Flower: Shape {
    // 이 꽃잎을 중앙에서 얼마나 멀리 이동시킬지?
    var petalOffset: Double = -20
    
    // 각 꽃잎을 만드는 폭
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        // 모든 꽃잎을 담을 Path
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // number만큼 꽃잎 회전
            let rotation = CGAffineTransform(rotationAngle: number)
            
            // 꽃잎을 이 view의 중심으로 이동
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            // 속성과 고정 Y 및 높이를 사용하여 이 꽃잎의 경로를 만듭니다.
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            // 회전/위치 변환을 꽃잎에 적용
            let rotatedPetal = originalPetal.applying(position)
            
            // 기본 경로에 추가
            path.addPath(rotatedPetal)
            
        }
        
        // 이제 기본 경로를 다시 보냅니다.
        return path
    }
}

struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
            // FillStyle을 사용하여 even-odd rule을 쉽게 적용할 수 있다.
                .fill(.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
