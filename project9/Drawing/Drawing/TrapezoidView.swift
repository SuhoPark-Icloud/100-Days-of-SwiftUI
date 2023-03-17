//
//  TrapezoidView.swift
//  Drawing
//
//  Created by 박수호 on 2023/03/18.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    // animatableData(computed property)를 추가함에 따라 애니메이션 효과가 나타남
    var animatableData: Double {
        get { insetAmount }
        set { insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct TrapezoidView: View {
    @State private var insetAmount = 50.0
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 100)
            .onTapGesture {
                withAnimation {
                    // 랜덤 값이다보니 이전 view와 다음 view 간의 interpolation이 일어나지 않아서 애니메이션 효과가 바로 나타나지 않는다.
                    insetAmount = Double.random(in: 10...90)
                }
            }
    }
}

struct TrapezoidView_Previews: PreviewProvider {
    static var previews: some View {
        TrapezoidView()
    }
}
